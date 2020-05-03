const express = require('express');
const router = express.Router();
const service = require('../services/userService.js');
var multer = require('multer');
var upload = multer({ dest: 'public/headImg/' });

// 获取用户信息
router.get("/userInfo", service.getUserInfo);

router.post('/uploadUserHead', upload.single('file'), service.uploadUserHead);

router.put("/msg", service.changeUserMsg);

router.put("/pwd", service.changePwd);

router.post('/bindEmail',service.bindEmail)

router.get('/sendCode',service.sendCode)

module.exports = router;