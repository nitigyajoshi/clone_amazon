console.log('hello');
const express=require('express');
const app=express();
const authRouter=require('./route/auth');
const mongoose=require('mongoose');
const adminRouter = require('./route/admin');
const productRouter = require('./route/product');
const userRouter = require('./route/user');
app.use(express.json());
const Port=process.env.PORT || 3000;
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//connecting to mongodb
mongoose.connect("mongodb+srv://nitigya:<enter you password removing angular brackets ie.<> >@cluster0.hijbzwt.mongodb.net/?retryWrites=true&w=majority")
.then(()=>{
    console.log('sucessfully connected')
}).catch(e=>{
    console.log(e);
});




app.listen(Port,
"0.0.0.0",
    ()=>{
console.log("connected to port"+Port);
});
