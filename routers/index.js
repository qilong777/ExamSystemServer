const express = require('express');
const router = express.Router();

const loginRouter = require('./loginRouter')
const userRouter = require('./userRouter')
const practiceRouter = require('./practiceRouter')


/* GET home page. */
router.use('/login', loginRouter);
router.use('/user', userRouter);
router.use('/practice', practiceRouter);

module.exports = router;