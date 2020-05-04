const db = require('../tools/db.js');

// 获取练习题目类型
const getPracticeType = async (req, res) => {
  const id = req.session.userId
  // const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }  
  try {
    let sql = "select professionId from student,class where student.classId=class.id and student.id=?";
    let data = [id]
    let result = await db.base(sql, data);

    let professionId = result[0].professionId
    sql = "select * from subject";
    result = await db.base(sql, []);

    data = []
    Array.from(result).forEach(ele=>{
      let professionIds = ele.professionIds.split(',')
      
      if(professionIds.indexOf(professionId+'')!== -1){
        data.push(ele)
      }
    })
    
    res.send({
      status: 1,
      msg: "获取数据成功",
      data
    });

    
   
  } catch (error) {
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}

// 获取练习题目类型
const getPracticesByIds = async (req, res) => {
  const id = req.session.userId
  // const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }

  let {subjectIds,origin,num} = req.body

  if(typeof subjectIds === 'string'){
    subjectIds = JSON.parse(subjectIds)
  }

  subjectIds = `(${subjectIds.join()})`
  
  try {
    let sql,data = []

    if(origin === '1'){
      sql = `
      select t1.* 
      from practice as t1,practice_info as t2 
      where t2.studentId=? and t1.subjectId in ${subjectIds}
      and t1.id = t2.practiceId and t2.isError = 1
      order by rand()
      limit 0,${num}
      `;
      data = [id,num]
    }else if(origin === '2'){
      sql = `
      select * 
      from practice
      where id not in 
      (select practiceId
      from practice_info
      where studentId=?
      )
      order by rand()
      limit 0,${num}
      `;
      data = [id,num]
    }else{
      sql = `select * from practice where subjectId in ${subjectIds} order by rand()
      limit 0,${num}`;
      data = [num]
    }
    let result = await db.base(sql, data);
    
    req.session.practice = result

    data = result.map(ele=>{
      return {
        question:ele.question,
        options:ele.options,
        type:ele.type
      }
    })
    
    if(data.length === 0){
      res.send({
        status: 0,
        msg: "该类型题目数量为0，请重新选择",
      });
    }else{
      res.send({
      status: 1,
      msg: "获取数据成功",
      data
    });
    }
    

  } catch (error) {
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}

// 判断是否有练习未完成
const hasPractice = async (req, res) => {
  const id = req.session.userId
  // const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let practice = req.session.practice
  if(practice){
    let data = practice.map(ele=>{
      return {
        question:ele.question,
        options:ele.options,
        type:ele.type
      }
    })
        
    res.send({
      status: 1,
      msg: "有练习未做完，是否继续？",
      data
    });
  }else{
    res.send({
      status: 0,
      msg: ""
    });
  }
  
}

// 获取练习结果
const getPracticeResult = async (req, res) => {
  const id = req.session.userId
  // const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let practice = req.session.practice
  if(!practice){
    res.send({
      status: 0,
      msg: "响应超时"
    });
    return 
  }
  
  try{
    
    let {answers} = req.body
    let sql,data,isError
      sql = `
      select * 
      from practice_info
      where studentId=?
      `
    data = [id]
    let result = await db.base(sql, data);
    
    practice.forEach((ele,index)=>{
      let answer
      if(ele.type === 2){
        answer = answers[index] || []
        answer = answer.sort().join('')
      }else{
        answer = answers[index] || ''
      }
      console.log(answer);
      
      if(answer+"" === ele.answer + ""){
        isError = 0
      }else{
        isError = 1
      }
      if(result.some(item=>item.practiceId === ele.id)){
        sql = `
        update practice_info 
        set isError=?,answer=?
        where studentId=? and practiceId=?
        `
        data = [isError,answer,id,ele.id]
      }else{
        sql = `
        insert into practice_info(studentId,practiceId,isError,answer)
        VALUES(?,?,?,?)
        `
        data = [id,ele.id,isError,answer]
      }
      db.base(sql, data);
    })
    req.session.practice = null
    res.send({
      status:1,
      data:practice
    })
  }catch(error){
    console.log(error);
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}

const errorPractice = async (req,res)=>{
  const id = req.session.userId
  // const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }  
  let {page,pageSize} = req.params
  
  try {
    let sql = `
      select t1.id as id,t1.answer as yourAnswer,t2.answer as answer,t2.options as options,
      t2.question as question,t2.type as type, t2.analysis as analysis,t3.name as name
      from practice_info as t1,practice as t2,subject as t3
      where studentId=? and isError=1 and t1.practiceId=t2.id and t2.subjectId=t3.id
      limit ${(page-1)*pageSize},${pageSize}
      `
    let result = await db.base(sql, [id]);

    let data = result.map(ele=>{
      if(ele.options !== ""){
        ele.options = ele.options.split('$$')
      }
      if(ele.type === 3){
        ele.question = ele.question.replace('$$',' ____')
      }
      return ele
    })

    sql = `
      select count(*) as count
      from practice_info
      where studentId=? and isError=1
    `
    result = await db.base(sql, [id]);
    
    res.send({
      status:1,
      msg:'查询错题成功',
      data:{
        errorList:data,
        total:result[0].count
      }
    })
    
  } catch (error) {
    console.log(error);
    res.send({
      status:0,
      msg:'查询失败'
    })
  }
}

const removeError = async (req,res)=>{
  const id = req.session.userId
  // const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }  
  let {removeId} = req.params
  
  try {
    let sql = `
    delete from practice_info 
    where id=?
    `
    await db.base(sql, [removeId]);
    res.send({
      status:1,
      msg:'删除成功'
    })
    
  } catch (error) {
    console.log(error);
    res.send({
      status:0,
      msg:'删除成功'
    })
  }
  
}




module.exports = {
  getPracticeType,
  getPracticesByIds,
  hasPractice,
  getPracticeResult,
  errorPractice,
  removeError
}