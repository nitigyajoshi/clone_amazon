
import 'package:flutter/material.dart';

import '../constant/global_variable.dart';
import '../service/auth_service.dart';
import '../widget/customwidget.dart';
import '../widget/textfield.dart';
enum auth{
  signin,signup
}
class AuthScreen extends StatefulWidget {
  static const String routeName='/auth-screen';
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  auth a=auth.signup;
  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  final signupformkey=GlobalKey<FormState>();
  final signinformkey=GlobalKey<FormState>();
  final AuthService _authService=AuthService();


  void dispose(){
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();


  }
//signup
  void signup(){
    print('called signup.......');
//Home();
    //print(_emailController.text);
    _authService.signupUser(context: context, email: _emailController.text, password: _passwordController.text, name: _nameController.text);

  }

  void signinUser(){
    _authService.signinUser(context: context, email: _emailController.text, password: _passwordController.text,
        );
print(_passwordController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Global.greyBackgroundCOlor,body: SafeArea(child:


    Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          Text('Welcome',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),
        ),
        ListTile(
          tileColor: a==auth.signup?Global.backgroundColor:Global.greyBackgroundCOlor,
          title: Text('CreateAccount',style: TextStyle(fontWeight: FontWeight.w500),),
          leading: Radio(activeColor: Global.secondaryColor,value: auth.signup, groupValue: a, onChanged: (auth ?value){
            setState(() {
              a=value!;

            });

          }),
        ),if(a==auth.signup)
      Container(padding: EdgeInsets.all(6),
      color: Colors.white,
      child: Form(key: signupformkey,child: Column(
        children: [
          TextFieldBox(controller: _nameController, hinttext: 'enter your name'),
          SizedBox(height: 10,),

          TextFieldBox(controller: _emailController, hinttext: 'enter your email'),
          SizedBox(height: 10,),

          TextFieldBox(controller: _passwordController, hinttext: 'enter your password'),
          SizedBox(height: 10,),

 CostomButton(text: 'Signup',ontap:(){
  // Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Home())));

//  // print('///////////');
if(signupformkey.currentState!.validate()){
//  // print('working signup..................');
signup();
// //print('working signup..................');
}

 },)
        ],

      )),
    ),

        if(a==auth.signin)Container(padding: EdgeInsets.all(5),
    color: Colors.white,
    child: Form(key: signinformkey,child: Column(
    children: [


    TextFieldBox(controller: _emailController, hinttext: 'enter your email'),
      SizedBox(height: 10,),

      TextFieldBox(controller: _passwordController, hinttext: 'enter your password'),
         SizedBox(height: 10,),
      CostomButton(text: 'Login',ontap:(){
        if(signinformkey.currentState!.validate()){
//  // print('working signup..................');
          signinUser();// //print('working signup..................');
      }


      },)
      ],

    )),
    ),
    ListTile(
    tileColor: a==auth.signin?Global.backgroundColor:Global.greyBackgroundCOlor,
    title: Text('Signin',style: TextStyle(fontWeight: FontWeight.w500),),
    leading: Radio(activeColor: Global.secondaryColor,value: auth.signin, groupValue:
    a
    , onChanged: (auth ?value){
    setState(() {
    a=value!;
    ///
    });

    }),
    ),



    ],

    ),
    )),);
  }
}

