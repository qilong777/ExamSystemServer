const express = require('express');
const router = express.Router();
const service = require('../services/practiceService.js');


// 获取用户的题目类型
router.get("/practiceType", service.getPracticeType);

// 获取用户的选择题目类型的题目
router.post("/practiceInfo", service.getPracticesByIds);

router.get("/hasPractice", service.hasPractice);

router.post("/practiceResult", service.getPracticeResult);

router.get("/errorPractice/:page/:pageSize", service.errorPractice);

router.delete("/errorPractice/:removeId", service.removeError);

module.exports = router;