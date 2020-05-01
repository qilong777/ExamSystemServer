const db = require('../tools/db.js');
const { createVerifyImg, Email } = require('../tools/base.js');
const expireTime = 60
//用户账号登录
const login = async (req, res) => {
  let { id, password, verify } = req.body;
  
  if (verify !== req.session.verifyImg) {
    res.send({
      status: -2,
      msg: "验证码错误"
    });
    return;
  }
  try {
    let sql = "select * from student where (id=? or email=?) and password=?";
    let data = [id, id, password];
    let result = await db.base(sql, data);

    if (result.length === 1) {
      req.session.userId = result[0].id;
      res.send({
        status: 1,
        msg: "登录成功"
      });
      return;
    }else{
      req.session.verifyImg = Math.random()
      res.send({
        status: 0,
        msg: "登录失败"
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

//用户邮箱登录
const emailLogin = async (req, res) => {
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
    let sql = "select * from student where email=?";
    let data = [email];
    let result = await db.base(sql, data);

    if (result.length === 1) {
      req.session.userId = result[0].id;
      res.send({
        status: 1,
        msg: "登录成功",
        userInfo:JSON.stringify({
          id:result[0].id,
          password:result[0].password
        })
      });
      return;
    }else{
      res.send({
        status: 0,
        msg: "登录失败"
      });
    }
  } catch (error) {
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}

//修改密码
const changePassword = async (req, res) => {
  let { email, code,password } = req.body;
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
    let sql = "update student set password=? where email=?";
    let data = [password,email];
    let result = await db.base(sql, data);

    if (result.affectedRows === 1) {
      res.send({
        status: 1,
        msg: "修改密码成功"
      });
      return;
    }else{
      res.send({
        status: 0,
        msg: "修改密码失败"
      });
    }
  } catch (error) {
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}


//自动登录
const autoLogin = async (req, res) => {
  let userInfo
  try {
    userInfo = JSON.parse(req.cookies.userInfo)
  } catch (error) {
    res.send({
      status: 0,
      msg: "用户信息失效"
    });
  }
  
  let { id, password } = userInfo;

  try {
    let sql = "select * from student where (id=? or email=?) and password=?";
    let data = [id, id, password];
    let result = await db.base(sql, data);

    if (result.length == 1) {
      req.session.userId = id;
      res.send({
        status: 1,
        msg: "登录成功"
      });
    } else {
      res.send({
        status: 0,
        msg: "用户信息失效"
      });
    }
  } catch (error) {
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}

//判断是否已经登录
const isLogined = async (req, res) => {
  
  let id = req.session.userId
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

//用户注册
const register = async (req, res) => {
  let { username, password, email, verify } = req.body;

  if (email !== req.session.email || verify !== req.session.verify) {
    res.send({
      msg: '验证码错误',
      status: 0
    });
    return;
  }

  if ((Email.time - req.session.time) / 1000 > 30) {
    res.send({
      msg: '验证码已过期，请重新发送验证码',
      status: 0
    });
    return;
  }

  //检查用户名是否被注册
  let sql = "select * from user where username=?";
  let result = await db.base(sql, [username]);
  if (result.length == 1) {
    res.send({
      msg: "注册失败,用户名已被注册",
      status: -1
    })
    return;
  }
  //检查邮箱是否被注册
  sql = "select * from user where email=?";
  result = await db.base(sql, [email]);
  if (result.length == 1) {
    res.send({
      msg: "注册失败,邮箱已被注册",
      status: -2
    })
    return;
  }

  //插入数据库
  sql = "insert into user set?";
  result = await db.base(sql, { username, password, email });

  if (result.affectedRows == 1) {
    res.send({
      msg: "注册成功",
      status: 1
    })
  } else {
    res.send({
      msg: "未知原因注册失败",
      status: -3
    })
  }

}

//退出登录
const logout = async (req, res) => {
  req.session.userId = null;
  res.send({
    msg: "退出成功",
    status: 1
  })
}

//获取图形验证码
const verifyImg = async (req, res) => {
  let result = await createVerifyImg(req, res);
  if (result) {
    res.send(result);
  }
}


//发送邮箱验证码
const sendCode = async (req, res) => {
  let email = req.query.email;
  let verify = Email.verify;
  let time = Email.time;

  try {
    let sql = "select * from student where email=?";
    let data = [email];
    let result = await db.base(sql, data);
    if (result.length !== 1) {
      res.send({
        msg: "邮箱不存在",
        status: 0
      });
      return;
    }

  } catch (error) {
    res.send({
      msg: "未知错误",
      status: 0
    });
  }
  
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
  login,
  emailLogin,
  changePassword,
  autoLogin,
  isLogined,
  register,
  logout,
  verifyImg,
  sendCode
}