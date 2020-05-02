const express = require('express');
const router = express.Router();
const service = require('../services/userService.js');

// 获取用户信息
router.get("/userInfo", service.getUserInfo);

// 获取用户的题目类型
router.get("/practiceType", service.getPracticeType);

// 获取用户的选择题目类型的题目
router.post("/practiceInfo", service.getPracticesByIds);

router.get("/hasPractice", service.hasPractice);

router.post("/practiceResult", service.getPracticeResult);


router.get("/demo", service.demo);
module.exports = router;