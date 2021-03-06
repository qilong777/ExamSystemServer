const express = require('express');
const router = express.Router();
const service = require('../services/teacherService.js');
const multer = require('multer');
const upload = multer();
const upload1 = multer({ dest: 'public/exam/' });

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

router.delete("/practice/:id", service.removePractice);


router.put("/practice/:id", service.changePractice);

router.post("/importPractice", upload.single('file'), service.importPractice);


router.post("/exam", service.getExamByClassIds);

router.delete("/exam/:id", service.removeExam);

router.post("/changeExam",upload1.single('file'), service.changeExam);

router.post("/addExam",upload1.single('file'), service.addExam);

router.post("/score", service.getScore);

router.delete("/score/:studentId/:examId", service.removeScore);

router.put("/score/:studentId/:examId", service.changeScore);

router.get("/profession", service.getProfessions);

router.get("/subject", service.getSubjectByProfessionIds);
router.post("/subject", service.addSubject);
router.delete("/subject/:id", service.removeSubject);
router.put("/subject/:id", service.changeSubject);

router.get("/exam/:id", service.getExamInfoById);

module.exports = router;