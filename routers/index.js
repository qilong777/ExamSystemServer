const express = require('express');
const router = express.Router();

const loginRouter = require('./loginRouter')
const userRouter = require('./userRouter')


/* GET home page. */
router.use('/login', loginRouter);
router.use('/user', userRouter);

module.exports = router;