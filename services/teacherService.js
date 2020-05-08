const db = require('../tools/db.js');
const nodeExcel = require('node-xlsx');
const fs=require('fs');
//用户账号登录
const login = async (req, res) => {
  let { id, password, verify } = req.body;
  
  if (verify !== req.session.verifyImg) {
    res.send({
      status: 0,
      msg: "验证码错误"
    });
    return;
  }
  try {
    let sql = "select * from teacher where id=? and password=?";
    let data = [id, password];
    let result = await db.base(sql, data);

    if (result.length === 1) {
      req.session.teacherId = result[0].id;
      res.send({
        status: 1,
        msg: "登录成功",
        data:{
          userInfo:{
            id:result[0].id,
            name:result[0].name
          }
        }
      });
      return;
    }else{
      req.session.verifyImg = Math.random()
      res.send({
        status: 0,
        msg: "用户名或密码错误"
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

//修改密码
const changePassword = async (req,res)=>{
  const id = req.session.teacherId
  // const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let {pwd} = req.body
  
  try {
    let sql = `
      update teacher
      set password=?
      where id=?`;
    let data = [pwd,id];
    await db.base(sql, data);
    res.send({
      msg: "密码修改成功",
      status: 1
    })
  } catch (error) {
    res.send({
      msg: "密码修改失败",
      status: 0,
    })
  }

}

//判断是否已经登录
const isLogined = async (req, res) => {
  const id = '10086'
  // const id = req.session.teacherId
  if (id) {
    res.send({
      msg: "获取用户信息成功",
      status: 1,
      data: {
        id
      }
    })
  } else {
    res.send({
      msg: "获取用户信息失败",
      status: 0
    })
  }
}


//退出登录
const logout = async (req, res) => {
  req.session.teacherId = null;
  res.send({
    msg: "退出成功",
    status: 1
  })
}

// 获取学院，专业，班级的大联动对象
const getClassTree = async (req,res) => {
  // const id = req.session.teacherId
  const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  try {
    let sql
    sql = `
      select * from academy
    `
    let academys = await db.base(sql, []);

    for (let i = 0; i < academys.length; i++) {
      const ele = academys[i];
      sql = `
      select id,name
      from profession
      where academyId=?
      `
      let professions = await db.base(sql, [ele.id]);

      for (let i = 0; i < professions.length; i++) {
        const ele = professions[i];
        sql = `
        select * 
        from class
        where professionId=?
        `
        let classes = await db.base(sql, [ele.id]);
        ele.children = classes
      }
      ele.children = professions
    }

    res.send({
      status :1,
      msg:'数据获取成功',
      data:academys
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'数据获取失败',
    })
  }
  
  
}


// 获取学生信息
const getStudentByClassId = async (req,res) => {
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let {ids,page,pageSize} = req.body
  
  let where = ''
  if(ids && ids !== ''){
    where = `and classId in (${ids})`
  }
  
  try {
    let sql
    sql = `
      select t1.id as id,t1.sex as sex,t1.name as name,t2.name as className,t2.id as classId,t3.id as professionId,t4.id as academyId
      from student as t1,class as t2,profession as t3,academy as t4
      where t1.classId=t2.id and t2.professionId=t3.id and t3.academyId=t4.id ${where}
      limit ${(page-1)*pageSize},${pageSize}
    `
    let studentList = await db.base(sql, []);

    sql = `
      select count(*) as total
      from student
      where 1=1 ${where}
    `
    let total = (await db.base(sql, []))[0].total

    res.send({
      status :1,
      msg:'数据获取成功',
      data:{
        studentList,
        total
      }
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'数据获取失败',
    })
  }
  
  
}

// 根据id删除学生信息
const removeStudent = async (req,res) => {
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let studentId = req.params.id
  
  try {
    let sql
    sql = `
    delete from student 
    where id=?
    `
    await db.base(sql, [studentId]);
    res.send({
      status :1,
      msg:'学生信息删除成功',
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'学生信息删除失败',
    })
  }
  
  
}

// 根据id修改学生信息
const changeStudent = async (req,res) => {
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let studentId = req.params.id
  let {sex,name,classId} = req.body
  
  try {
    let sql
    sql = `
    update student 
    set name=?,classId=?,sex=?
    where id=?
    `
    await db.base(sql, [name,classId,sex,studentId]);
    res.send({
      status :1,
      msg:'学生信息修改成功',
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'学生信息修改失败',
    })
  }
  
  
}
// 导入学生信息
const importStudent = async (req,res) =>{
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  
  try {
    let file = req.file
    let sql
    const list = nodeExcel.parse(file.buffer); // 同步操作
    let columns
    for (let i = 0,len = list.length; i < len; i++) {
      const data = list[i].data;
      for (let j = 0; j < data.length; j++) {
        const ele = data[j];
        if(j === 0){
          columns = `(${ele.join(',')},password)`
        }else{
          sql = `
          select *
          from student
          where id=?
          `
          let result = await db.base(sql, [ele[0]]);
          if(result.length>0){
            sql = `
            update student 
            set name=?,sex=?,classId=?
            where id=?
            `
            await db.base(sql, [ele[1],ele[2],ele[3],ele[0]]);
          }else{
            sql = `
            insert into student${columns}
            VALUES(?,?,?,?,'e10adc3949ba59abbe56e057f20f883e')
            `
            await db.base(sql, [...ele]);
          }
        }
      }
    }
    res.send({
      status:1,
      msg:'学生数据上传成功'
    })
  } catch (error) {
    console.log(error);
    
    res.send({
      status:0,
      msg:'数据上传异常，可能有一些数据没有上传成功'
    })
  }
  

}

// 获取科目，练习的联动对象
const getSubjects = async (req,res) => {
  // const id = req.session.teacherId
  const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  try {
    let sql
    sql = `
      select * from subject
    `
    let subjects = await db.base(sql, []);
    res.send({
      status :1,
      msg:'数据获取成功',
      data:subjects
    })
  } catch (error) {
    console.log(error);
    
    res.send({
      status :0,
      msg:'数据获取失败',
    })
  }
  
  
}

// 获取练习信息
const getPracticeBySubjectId = async (req,res) => {
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let {ids,page,pageSize} = req.body
  console.log(ids);
  
  let where = ''
  if(ids && ids !== ''){
    where = `and subjectId in (${ids})`
  }
  
  try {
    let sql
    sql = `
      select t1.id as id,t1.type as type,
      t1.question as question,t1.options as options,t2.id as subjectId,
      t1.answer as answer,t1.analysis as analysis,t2.name as subjectName
      from practice as t1,subject as t2
      where t1.subjectId=t2.id ${where}
      limit ${(page-1)*pageSize},${pageSize}
    `
    let practiceList = await db.base(sql, []);

    sql = `
      select count(*) as total
      from practice
      where 1=1 ${where}
    `
    let total = (await db.base(sql, []))[0].total

    res.send({
      status :1,
      msg:'数据获取成功',
      data:{
        practiceList,
        total
      }
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'数据获取失败',
    })
  }
  
  
}

// 根据id删除练习信息
const removePractice = async (req,res) => {
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let practiceId = req.params.id
  
  try {
    let sql
    sql = `
    delete from practice 
    where id=?
    `
    await db.base(sql, [practiceId]);
    res.send({
      status :1,
      msg:'练习信息删除成功',
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'练习信息删除失败',
    })
  }
  
  
}

// 根据id修改练习信息
const changePractice = async (req,res) => {
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let practiceId = req.params.id
  let {subjectId,type,question,options,answer,analysis} = req.body
  console.log(subjectId,type,question,options,answer,analysis);
  
  try {
    let sql
    sql = `
    update practice 
    set subjectId=?,type=?,question=?,options=?,answer=?,analysis=?
    where id=?
    `
    await db.base(sql, [subjectId,type,question,options,answer,analysis,practiceId]);
    res.send({
      status :1,
      msg:'习题信息修改成功',
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'习题信息修改失败',
    })
  }
  
  
}
// 导入练习信息
const importPractice = async (req,res) =>{
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  
  try {
    let file = req.file
    let sql
    const list = nodeExcel.parse(file.buffer); // 同步操作
    let columns
    for (let i = 0,len = list.length; i < len; i++) {
      const data = list[i].data;
      for (let j = 0; j < data.length; j++) {
        const ele = data[j];
        if(j === 0){
          columns = `(${ele.join(',')})`
        }else{
          sql = `
          insert into practice${columns}
          VALUES(?,?,?,?,?,?)
          `
          await db.base(sql, [...ele]);
        }
      }
    }
    res.send({
      status:1,
      msg:'习题数据上传成功'
    })
  } catch (error) {
    console.log(error);
    
    res.send({
      status:0,
      msg:'数据上传异常，可能有一些数据没有上传成功'
    })
  }
  

}

// 获取考试信息
const getExamByClassIds = async (req,res) => {
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  try {
    let {ids,page,pageSize} = req.body
    
    idArr = ids.split(',')
    let len1 = idArr.length
    let sql
    sql = `
      select t1.time as time,t1.id as id,t1.classIds as classIds,t2.name as subjectName,t1.filePath as filePath,t2.id as subjectId
      from exam as t1,subject as t2
      where t1.subjectId=t2.id
    `

    let result = await db.base(sql, []);
    
    let examList
    if(!ids || ids === ''){
      examList = result
    }else{
      examList = []
      result.forEach(ele=>{
      let eleClassIds = ele.classIds.split(',')
      let len2 = eleClassIds.length
      let set = new Set([...eleClassIds,...idArr])
      
      if(set.size < len1+len2){    
        examList.push(ele)
      }
    })
    }
    let total = examList.length

    let startIndex = (page-1)*pageSize
    let endIndex = startIndex + pageSize
    examList = examList.slice(startIndex,endIndex)

    res.send({
      status :1,
      msg:'数据获取成功',
      data:{
        examList,
        total
      }
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'数据获取失败',
    })
  }
  
  
}

// 根据id删除考试信息
const removeExam = async (req,res) => {
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let practiceId = req.params.id
  
  try {
    let sql
    sql = `
    delete from exam 
    where id=?
    `
    await db.base(sql, [practiceId]);
    res.send({
      status :1,
      msg:'练习信息删除成功',
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'练习信息删除失败',
    })
  }
  
  
}

// 根据id修改考试信息
const changeExam = async (req,res) => {
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }

  try {
    let {subjectId, classIds,time} = req.body
    time = Number(time)
    let examId = req.body.id
    let file = req.file
    let sql
    sql = `
    select name 
    from subject
    where id=?
    `
    let fileName = (await db.base(sql, [subjectId]))[0].name + '.xlsx';

    let oldName
    if(!file){
      sql = `
      select filePath 
      from exam
      where id=?
      `
      let result = await db.base(sql, [examId]);
      oldName = result[0].filePath
    }else{
      
      if(file.mimetype!== 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'){
        res.send({
          msg: "文件格式错误",
          status: 0,
        })
        return
      }
      oldName = file.filename
    }
    await fs.rename("public/exam/" + oldName, `public/exam/${fileName}`,err=>{
      if(err){
        res.send({
          status:0,
          msg:'修改考试信息失败'
        })
        
      }
    });

    
    
    sql = `
    update exam 
    set subjectId=?,classIds=?,filePath=?,time=?
    where id=?
    `
    await db.base(sql, [subjectId,classIds,fileName,time,examId]);
    res.send({
      status:1,
      msg:'修改考试信息成功'
    })
    
  } catch (error) {
    console.log(err);
    
    res.send({
      status:0,
      msg:'修改考试信息失败'
    })
  }
}

const addExam = async (req,res) => {
  const id = req.session.teacherId
  // const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }

  try {
    let {subjectId, classIds,time} = req.body
    let file = req.file
    time = Number(time)
    

    if(!file || file.mimetype!== 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'){
      res.send({
        msg: "文件格式错误",
        status: 0,
      })
      return
    }
    let sql = `
      select name
      from subject
      where id=?
    `


    let subjectName = (await db.base(sql, [subjectId]))[0].name
    let fileName = subjectName + '.xlsx';
    await fs.rename("public/exam/" + file.filename, `public/exam/${fileName}`,err=>{
      if(err){
        throw err
      }
    });
    
    sql = `
    insert into exam(subjectId,classIds,filePath,time)
    value(?,?,?,?)
    `
    await db.base(sql, [subjectId,classIds,fileName,time]);

    sql = `
    insert into message(content)
    value(?)
    `
    let content = `${subjectName}考试已发布，考试时长${time}分钟，请需要参加考试的同学们尽快完成考试`
    let result = await db.base(sql,[content])
    let messageId = result.insertId
    

    sql = `
      select id
      from student
      where classId in (${classIds})
    `

    result = await db.base(sql,[])

    for (let i = 0,len=result.length; i < len; i++) {
      const ele = result[i];
      sql = `
      insert into message_info(studentId,messageId)
      value(?,?)
      `
      await db.base(sql,[ele.id,messageId])
    }

    

    res.send({
      status:1,
      msg:'添加考试信息成功'
    })
    
  } catch (error) {
    console.log(error);
    
    res.send({
      status:0,
      msg:'添加考试信息失败'
    })
  }
}

// 获取学生信息
const getScore = async (req,res) => {
  // const id = req.session.teacherId
  const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let {classIds,subjectIds,page,pageSize} = req.body
  console.log(classIds,subjectIds,page,pageSize);

  let noClassIds = false,noSubjectIds  = false
  if(classIds === ""){
    noClassIds = true
  }

  if(subjectIds === ""){
    noSubjectIds = true
  }

  
  
  try {
    let sql
    sql = `
    select 
    t4.name as className,
    t1.studentId as studentId,
    t5.name as name,
    t3.name as subjectName,
    t1.score as score,
    t1.examId as examId,
    t4.id as classId,
    t3.id as subjectId
    from exam_info as t1,exam as t2,subject as t3,class as t4,student as t5
    where t1.studentId=t5.id and t2.subjectId=t3.id and t1.examId=t2.id and t4.id=t5.classId
    `
    // limit ${(page-1)*pageSize},${pageSize}
    let scoreList = await db.base(sql, []);

    classIds = classIds.split(',')
    subjectIds = subjectIds.split(',')


    scoreList = scoreList.filter(ele=>{
      if(!noClassIds && classIds.indexOf(ele.classId + "") === -1){
        return false
      }
      
      
      if(!noSubjectIds && subjectIds.indexOf(ele.subjectId + "") === -1){        
        return false
      }
      return true
    })

    let total = scoreList.length

    scoreList = scoreList.slice((page-1)*pageSize,page*pageSize)

    res.send({
      status :1,
      msg:'数据获取成功',
      data:{
        scoreList,
        total
      }
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'数据获取失败',
    })
  }
  
  
}

// 根据id删除考试信息
const removeScore = async (req,res) => {
  // const id = req.session.teacherId
  const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let {studentId,examId} = req.params
  
  try {
    let sql
    sql = `
    delete from exam_info
    where studentId=? and examId=?
    `
    await db.base(sql, [studentId,examId]);
    res.send({
      status :1,
      msg:'成绩信息删除成功',
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'成绩信息删除失败',
    })
  }
}

// 根据id修改考试信息
const changeScore = async (req,res) => {
  // const id = req.session.teacherId
  const id = '10086'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let {studentId,examId} = req.params
  let {score} = req.body
  
  try {
    let sql
    sql = `
    update exam_info
    set score=?
    where studentId=? and examId=?
    `
    await db.base(sql, [score,studentId,examId]);
    res.send({
      status :1,
      msg:'成绩信息修改成功',
    })
  } catch (error) {
    res.send({
      status :0,
      msg:'成绩信息修改失败',
    })
  }
}

module.exports = {
  login,
  changePassword,
  isLogined,
  logout,
  getClassTree,
  getStudentByClassId,
  removeStudent,
  changeStudent,
  importStudent,
  getSubjects,
  getPracticeBySubjectId,
  removePractice,
  changePractice,
  importPractice,
  getExamByClassIds,
  removeExam,
  changeExam,
  addExam,
  getScore,
  removeScore,
  changeScore
}