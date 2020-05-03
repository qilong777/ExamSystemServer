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
        msg: "登录成功"
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
  // const id = req.session.teacherId
  const id = '10086'
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
  // const id = req.session.teacherId
  const id = '10086'
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
  // const id = req.session.teacherId
  const id = '10086'
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

module.exports = {
  login,
  changePassword,
  isLogined,
  logout,
  getClassTree,
  getStudentByClassId,
  removeStudent,
  changeStudent,
  importStudent
}