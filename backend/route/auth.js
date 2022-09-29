const express=require('express');
const User=require('../model/email');
const auth=require('../middleware/auth');

//const mongoose=require('mongoose');
const bcryptjs=require('bcryptjs');
const bcr=require('bcrypt');
const authRouter=express.Router();
const jwt=require("jsonwebtoken");
// authRouter.get("/ok",(req,res)=>{
//     res.send("hhkjhjkj");
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
    const hashedPassword=await bcr.hash(password,8)
 //const hashedPassword=await bcryptjs.hash(password,salt);

let user=new User({
    name,email,password:hashedPassword
});

user=await user.save();
res.json({user:user});//or res.json(user);both same..
res.send("hhbhjhjhj.");}
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
const isMatch=bcr.compare(password,user.password );
                                                //        );
//const isMatch=await bcryptjs.compare(password,user.password);
if(!isMatch){
return res.status(400).json({error:'.incorrect password'});
}

const token=jwt.sign({id:user._id},"passwordKey");
res.json({token,
...
user
._doc
});

}
catch(e){
return res.status(500).json({//error:'hrk'
error:e.message
});}
//making auth router public that can be access from any file
});

authRouter.post("/token",async(req,res)=>{
try{
const token=req.header('x-auth-token');
if(!token) return res.json(false);
const verified=jwt.verify(token,"passwordKey");
if(!verified)return res.json(false);
const user=await User.findById(verified.id);
if(!user)return res.json(false);
//return
 res.json(true);

}catch(e){
res.status(500).json({error:e.message});
}
});


authRouter.get('/',auth,async(req,res)=>{
const user=await User.findById(req.user.token);
res.json({
//...
user
//._doc
,token:req.token});
});
module.exports=authRouter;