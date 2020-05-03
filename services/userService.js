const db = require('../tools/db.js');
const fs = require('fs')
const { Email } = require('../tools/base.js');
const expireTime = 60
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
      let {email,name,classId,headImg,msg} = result[0]
      
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
          exam:result,msg
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

const uploadUserHead = async (req, res) => {
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
    // var imgType = "." + req.file.mimetype.substring(6);
    let file = req.file
    if(file.mimetype!== 'image/jpeg' && file.mimetype!== 'image/png'){
      res.send({
        msg: "文件格式错误",
        status: 0,
      })
      return
    }
    let index = file.originalname.lastIndexOf('.')
    let imgType = file.originalname.slice(index);
    let filename = id + imgType
    
    await fs.rename("public/headImg/" + file.filename, "public/headImg/" + filename,err=>{
      if(err){
        throw err
      }
    });

    let sql = `
      update student
      set headImg=?
      where id=?`;
    let data = [filename,id];
    await db.base(sql, data);
    res.send({
      msg: "头像修改成功",
      status: 1,
      data: {
        headImg:`headImg/${filename}`
      }
    })
  } catch (error) {
    console.log(error);
    res.send({
      msg: "头像修改失败",
      status: 0,
    })
  }
  
}

const changeUserMsg = async (req,res)=>{
  const id = req.session.userId
  // const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let {msg} = req.body
  try {
    let sql = `
      update student
      set msg=?
      where id=?`;
    let data = [msg,id];
    await db.base(sql, data);
    res.send({
      msg: "信息修改成功",
      status: 1,
      data: {
        msg
      }
    })
  } catch (error) {
    res.send({
      msg: "信息修改失败",
      status: 0,
    })
  }

}

const changePwd = async (req,res)=>{
  const id = req.session.userId
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
      update student
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

//用户邮箱登录
const bindEmail = async (req, res) => {
  const id = req.session.userId
  // const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }
  let { email, code } = req.body;
  
  if (email !== req.session.email || code !== req.session.code) {
    res.send({
      status: 0,
      msg: "邮箱或验证码错误"
    });
    return;
  }
  if ((Email.time - req.session.time) / 1000 > expireTime) {
    res.send({
      msg: '验证码已过期，请重新发送验证码',
      status: 0
    });
    return;
  }
  try {
    let sql = `update student
              set email=?
              where id=?`;
    let data = [email,id];
    await db.base(sql, data);

    res.send({
      status: 1,
      msg: "邮箱绑定成功",
    })
  } catch (error) {
    res.send({
      status: 0,
      msg: "邮箱绑定失败"
    });
  }
  
}

//发送邮箱验证码
const sendCode = async (req, res) => {
  let email = req.query.email;
  let verify = Email.verify;
  let time = Email.time;
  
  const remainTime = (time - req.session.time) / 1000
  if (req.session.time &&  remainTime<= expireTime) {
    res.send({
      msg: `验证码已发送,请等${expireTime}s再重发`,
      status: 0,
      remainTime:expireTime-remainTime
    });
    return;
  }

  // 验证码
  req.session.code = verify;
  // 发送的邮箱
  req.session.email = email;
  

  let mailOptions = {
    from: '浩考 1635889910@qq.com',
    to: email,
    subject: '浩考网邮箱验证码',
    text: '验证码为：' + verify + ' 请不要把该验证码发送给他人'
  }
  Email.transporter.sendMail(mailOptions, err => {
    if (err) {
      res.send({
        msg: "验证码发送失败",
        status: 0
      });
    } else {
      req.session.time = time;
      res.send({
        msg: "验证码发送成功",
        status: 1
      });
    }
  });
}

module.exports = {
  getUserInfo,
  uploadUserHead,
  changeUserMsg,
  changePwd,
  bindEmail,
  sendCode
}