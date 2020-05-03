const express = require('express');
const router = express.Router();
const service = require('../services/teacherService.js');
const multer = require('multer');
const upload = multer();

//登录
router.post("/login", service.login);

router.post("/changePassword", service.changePassword);
//判断是否已经登录
router.get("/isLogined", service.isLogined);

//退出登录
router.get("/logout", service.logout);

router.get("/getClassTree", service.getClassTree);

router.post("/student", service.getStudentByClassId);

router.delete("/student/:id", service.removeStudent);

router.put("/student/:id", service.changeStudent);

router.post("/importStudent", upload.single('file'), service.importStudent);

router.get("/getSubjects", service.getSubjects);

router.post("/practice", service.getPracticeBySubjectId);


module.exports = router;