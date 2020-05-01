const db = require('../tools/db.js');
// 获取用户信息
const getUserInfo = async (req, res) => {
  const id = req.session.userId
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }  
  try {
    let sql = "select * from student where id=?";
    let data = [id];
    let result = await db.base(sql, data);
    
    if (result.length === 1) {
      let {email,name,classId,headImg} = result[0]
      
      sex = result[0].sex === 1 ? '男':'女'
      headImg =`headImg/${headImg === '' ? (sex === '男' ? 'nan.png':'nv.png'):headImg}` 
      
      sql = `
      select t1.name as className,t2.name as professionName,t3.name as academyName 
      from class as t1,profession as t2,academy as t3 
      where t1.id=? and t1.professionId=t2.id and t2.academyId=t3.id
      `
      data = [classId]
      result = await db.base(sql, data)
      let {className,professionName,academyName} = result[0]

      sql = `
      select *
      from practice_Info
      where studentId=?
      `
      data = [id]
      result = await db.base(sql, data)

      let practiceNum = result.length

      
      let errorNum = 0,correctNum = 0
      result.forEach(ele => {
        if(ele.isError === 1){
          errorNum++
        }else{
          correctNum++
        }
      });

      sql = `
      select t3.name as examName,score
      from exam as t1,exam_info as t2,subject as t3
      where t2.studentId=? and t1.id=t2.examId and t1.subjectId=t3.id
      `
      data = [id]
      result = await db.base(sql, data)
      
      res.send({
        status: 1,
        msg: "获取用户信息成功",
        data:{
          id,email,name,sex,className,professionName,
          academyName,headImg,practiceNum,errorNum,correctNum,
          exam:result,
        }
      });

    }else{
      res.send({
        status: 0,
        msg: "获取用户信息失败"
      });
    }
  } catch (error) {
    req.session.verifyImg = Math.random()
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}

// 获取练习题目类型
const getPractice = async (req, res) => {
  // const id = req.session.userId
  const id = '201611621123'
  if(!id){
    res.send({
      status: 0,
      msg: "获取用户信息失败"
    });
    return;
  }  
  try {
    let sql = "select professionId from student,class where student.classId=class.id and student.id=?";
    let data = [id]
    let result = await db.base(sql, data);

    let professionId = result[0].professionId
    sql = "select * from subject";
    result = await db.base(sql, []);

    data = []
    Array.from(result).forEach(ele=>{
      let professionIds = ele.professionIds.split(',')
      
      if(professionIds.indexOf(professionId+'')!== -1){
        data.push(ele)
      }
    })
    
    res.send({
      status: 1,
      msg: "获取数据成功",
      data
    });

    
   
  } catch (error) {
    res.send({
      status: 0,
      msg: "未知错误"
    });
  }
  
}



module.exports = {
  getUserInfo,
  getPractice
 
}