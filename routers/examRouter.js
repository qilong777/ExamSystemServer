const express = require('express');
const router = express.Router();
const service = require('../services/examService.js');


// 获取用户的题目类型
router.get("/exam", service.getAllExam);

router.get("/exam/:id", service.getExamInfoById);

router.post("/examResult", service.getExamResult);

module.exports = router;