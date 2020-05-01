const express = require('express');
const router = express.Router();
const service = require('../services/userService.js');

// 获取用户信息
router.get("/userInfo", service.getUserInfo);

// 获取用户信息
router.get("/practice", service.getPractice);



module.exports = router;