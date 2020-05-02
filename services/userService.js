const db = require('../tools/db.js');
// 获取用户信息
const getUserInfo = async (req, res) => {
  const id = req.session.userId
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }  
  try {
    let sql = "select * from student where id=?";
    let data = [id];
    let result = await db.base(sql, data);
    
    if (result.length === 1) {
      let {email,name,classId,headImg} = result[0]
      
      sex = result[0].sex === 1 ? '男':'女'
      headImg =`headImg/${headImg === '' ? (sex === '男' ? 'nan.png':'nv.png'):headImg}` 
      
      sql = `
      select t1.name as className,t2.name as professionName,t3.name as academyName 
      from class as t1,profession as t2,academy as t3 
      where t1.id=? and t1.professionId=t2.id and t2.academyId=t3.id
      `
      data = [classId]
      result = await db.base(sql, data)
      let {className,professionName,academyName} = result[0]

      sql = `
      select *
      from practice_Info
      where studentId=?
      `
      data = [id]
      result = await db.base(sql, data)

      let practiceNum = result.length

      
      let errorNum = 0,correctNum = 0
      result.forEach(ele => {
        if(ele.isError === 1){
          errorNum++
        }else{
          correctNum++
        }
      });

      sql = `
      select t3.name as examName,score
      from exam as t1,exam_info as t2,subject as t3
      where t2.studentId=? and t1.id=t2.examId and t1.subjectId=t3.id
      `
      data = [id]
      result = await db.base(sql, data)
      
      res.send({
        status: 1,
        msg: "获取用户信息成功",
        data:{
          id,email,name,sex,className,professionName,
          academyName,headImg,practiceNum,errorNum,correctNum,
          exam:result,
        }
      });

    }else{
      res.send({
        status: 0,
        msg: "获取用户信息失败"
      });
    }
  } catch (error) {
    req.session.verifyImg = Math.random()
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}

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
        options:ele.options
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
        options:ele.options
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




module.exports = {
  getUserInfo,
  getPracticeType,
  getPracticesByIds,
  hasPractice
}