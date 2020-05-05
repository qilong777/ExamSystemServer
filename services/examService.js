const db = require('../tools/db.js');
const nodeExcel = require('node-xlsx');

// 获取练习题目类型
const getAllExam = async (req, res) => {
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
    let sql = `
    select classId
    from student
    where id=?
    `;
    let result = await db.base(sql, [id]);
    let classId = result[0].classId

    sql = `
    select t1.classIds,t1.id as examId,t1.time as time,t2.name as subjectName
    from exam as t1,subject as t2
    where t1.subjectId=t2.id and t1.id not in (
      select examId
      from exam_info
      where studentId=?
    )
    `;
    result = await db.base(sql, [id]);
    let examList = []
    for (let i = 0,len = result.length; i < len; i++) {
      const ele = result[i];
      let classIds = ele.classIds.split(',')
      if(classIds.indexOf(classId+"")!==-1){
        examList.push(ele)
      }
    }
    
    res.send({
      status: 1,
      msg: "获取数据成功",
      data:{
        examList
      }
    });
   
  } catch (error) {
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}


const getScore = async (id,examId) =>{
  try {
    let sql = `
    insert into exam_info(studentId,examId,score)
    value(?,?,?)
    `
    await db.base(sql,[id,examId,0])
    
  }catch(err){
    console.log(err);
    
  }
}
// 获取练习题目类型
const getExamInfoById = async (req, res) => {
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
    let examId = req.params.id
    
    let sql = `
    select filePath,time
    from exam
    where id=?
    `;
    let result = await db.base(sql, [examId]);
    let {filePath,time} = result[0]
    time = (time+5) *60*1000
    let list = nodeExcel.parse(`public/exam/${filePath}`); // 同步操作

    
    list = list[0].data
    
    let examInfo = []
    let key = []
    for (let i = 0,len = list.length; i < len; i++) {
      const ele = list[i];
      if(i === 0){
        key = ele
        continue
      }
      let obj = {}
      for (let j = 0; j < ele.length; j++) {
        const item = ele[j];
        obj[key[j]] = item
      }
      examInfo.push(obj)
    }
    req.session.exam = {
      examInfo,
      examId
    }

    examInfo = examInfo.map(ele=>{
      return {
        type:ele.type,
        question:ele.question,
        options:ele.options||'',
        score:ele.score
      }
    })

    let timer = setInterval(()=>{
      time-=10000
      if(time<=0 || !req.session.exam){
        getScore(id,examId)
        clearInterval(timer)
        timer = null
      }
    },1000)
    
    res.send({
      status: 1,
      msg: "获取数据成功",
      data:{
        examInfo
      }
    });
   
  } catch (error) {
    console.log(error);
    
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}

// 获取练习题目类型
const getExamResult = async (req, res) => {
  const id = req.session.userId
  // const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let exam = req.session.exam
  
  if(!exam){
    res.send({
      status: 0,
      msg: "响应超时"
    });
    return 
  }
  let examInfo = req.session.exam.examInfo
  let examId = req.session.exam.examId
  try {
    let scores = 0
    let {answers} = req.body
    examInfo.forEach((ele,index)=>{
      let answer
      if(ele.type === 2){
        answer = answers[index] || []
        answer = answer.sort().join('')
      }else{
        answer = answers[index] || ''
      }
      
      if(answer+"" === ele.answer + ""){
        scores += Number(ele.score)
      }
    })
    let sql = `
    insert into exam_info(studentId,examId,score)
    value(?,?,?)
    `
    await db.base(sql,[id,examId,scores])

    sql = `
    select t2.name as subjectName
    from exam as t1,subject as t2
    where t1.id=? and t1.subjectId=t2.id
    `
    let examName = (await db.base(sql,[examId]))[0].subjectName
    req.session.exam = null
    res.send({
      status: 1,
      msg: "试卷提交成功",
      data:{
        result:`考试完成，${examName}得分${scores}`
      }
    });
   
  } catch (error) {
    console.log(error);
    
    res.send({
      status: 0,
      msg: "试卷提交失败"
    });
  }
  
}




module.exports = {
  getAllExam,
  getExamInfoById,
  getExamResult
}
