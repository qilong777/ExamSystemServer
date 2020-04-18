const express = require('express');
const router = express.Router();

const userRouter = require('./userRouter')


/* GET home page. */
router.use('/user', userRouter);

module.exports = router;