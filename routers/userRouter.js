const express = require('express');
const router = express.Router();
const service = require('../services/userService.js');

//登录
router.post("/login", service.login);
router.post("/emailLogin", service.emailLogin);
router.post("/changePassword", service.changePassword);

//自动登录
router.post("/autologin", service.autologin);

//判断是否已经登录
router.get("/islogined", service.islogined);

//注册
router.post("/register", service.register);

//退出登录
router.get("/logout", service.logout);

//获取验证码图片
router.get("/verifyImg", service.verifyImg)

//发送邮箱验证码
router.get('/sendCode', service.sendCode);


module.exports = router;