const jwt=require('jsonwebtoken');
const User=require('../model/email');


const admin=async (req,res,next)=>{
    try{
        const token=req.header("x-auth-token");
        if(!token)return res.status(401).json({msg:'No .Auth token,acess denied'});
        const verified=jwt.verify(token,"passwordKey");
        if(!verified)
        return res.status(401).json({msg:"token verification failed"});
        const user=await User.findById(verified.id)
        if (user.type=="user"||user.type=="seller") {
            return res.status(401).json({msg:"you are not admin"});
        }
        req.user=verified.id;
        req.token=token;
        next();
        
        }
        catch(e){
        res.status(500).json({
        error:err.message
        })
        }


}
module.exports=admin;