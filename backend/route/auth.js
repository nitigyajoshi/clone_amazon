const express=require('express');
const User=require('../model/email');
//const mongoose=require('mongoose');
const bcryptjs=require('bcryptjs');
//const bcr=require('bcrypt');
const authRouter=express.Router();
const jwt=require("jsonwebtoken");
// authRouter.get("/ok",(req,res)=>{
//     res.send("hhkjhjkjk");
// })
//signup...


authRouter.post("/auth/signup",async(req,res)=>{
try{
    const {name,email,password}=req.body;
    const existingUser=await User.findOne({email:email});
    //print(password);
    if (!req.body.name) {
        return res.status(400).json({
          status: 'error',
          error: 'req body cannot be empty',
        });
      }

      res.status(200).json({
        status: 'succes',
        data: req.body,
      })


    if(existingUser){
        return res.status(400).json({
    msg:'user already exist'

        })
    }
    //var salt=bcr.genSalt(2);
    //const hashedPassword=await bcr.hash(password,8)
 const hashedPassword=await bcryptjs.hash(password,8);

let user=new User({
    name,email,password:hashedPassword
});

user=await user.save();
res.json({user:user});//or .res.json(user);both same..
res.send("hhbj");}
catch(e){
   return res.status(500).json({error:e.message});
}
});

/////////////////////signin
authRouter.post("/auth/signin",async(req,res)=>{
try{
const{email,password}=await req.body;
//print(password);
const user=await User.findOne({email});
if(!user){
return res.status(400).json({msg:"user .with this email not exist."});
}
//const isMatch=bcr.compare(password,user.password);
//function(err, res) {
// if(err) {
// return res.json({error :e.message});
// }   } );
//                                                                );
const isMatch=await bcryptjs.compare(password,user.password);

if(!isMatch){

return res.status(400).json({error:'.incorrect password.'});
}

const token=jwt.sign({id:user._id},"passwordKey");
res.json({token,...user._doc});

}
catch(e){
return res.status(500).json({//error:'hkk'
error:e.message
});
}


//making auth router public that can be access from any file
});
module.exports=authRouter;