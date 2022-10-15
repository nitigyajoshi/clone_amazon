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
const db="mongodb+srv://nitigya:Khandada@977@cluster0.hijbzwt.mongodb.net/?retryWrites=true&w=majority";
//app.use(express.json());
//connecting to mongodb
mongoose.connect("mongodb+srv://nitigya:Khandada%40977@cluster0.hijbzwt.mongodb.net/?retryWrites=true&w=majority")
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