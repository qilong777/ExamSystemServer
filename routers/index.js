const express = require('express');
const router = express.Router();

const loginRouter = require('./loginRouter')
const userRouter = require('./userRouter')
const practiceRouter = require('./practiceRouter')

const teacherRouter = require('./teacherRouter')

/* GET home page. */
router.use('/login', loginRouter);
router.use('/user', userRouter);
router.use('/practice', practiceRouter);

router.use('/teacher', teacherRouter);

module.exports = router;