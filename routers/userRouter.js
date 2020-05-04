const express = require('express');
const router = express.Router();
const service = require('../services/userService.js');
const multer = require('multer');
const upload = multer({ dest: 'public/headImg/' });

// 获取用户信息
router.get("/userInfo", service.getUserInfo);

router.post('/uploadUserHead', upload.single('file'), service.uploadUserHead);

router.put("/msg", service.changeUserMsg);

router.put("/pwd", service.changePwd);

router.post('/bindEmail',service.bindEmail)

router.get('/sendCode',service.sendCode)

router.put("/message/:id", service.readMessage);

router.delete("/message/:id", service.removeMessage);

module.exports = router;