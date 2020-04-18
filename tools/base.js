const captcha = require("trek-captcha");
const nodemailer = require("nodemailer");

let createVerifyImg = (req, res) => {
  return captcha().then((info) => {
    req.session.verifyImg = info.token;
    return info.buffer;
  }).catch(() => {
    return false
  });
}

let Email = {
  config: {
    host: 'smtp.qq.com',
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
      user: "1635889910@qq.com", // generated ethereal user
      pass: "rixfhegnxohibgbh" // generated ethereal password
    }
  },
  get transporter() {
    return nodemailer.createTransport(this.config);
  },
  get verify() {
    //返回验证码
    return Math.random().toString().slice(-4);
  },
  get time() {
    return Date.now();
  }
}

module.exports = {
  createVerifyImg,
  Email
}