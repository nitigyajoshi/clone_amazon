
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/provider/user_provider.dart';
import 'package:untitled/widget/bottom_bar.dart';

import '../constant/error_handeling.dart';
import '../constant/global_variable.dart';
import '../constant/utils.dart';
import '../home.dart';
import '../model/user_model.dart';
class AuthService{
  void signupUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name
  })async{
    try{
      User user=User(id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');
      print('send...');
      print(user.toJson());
      http.Response res=await http.post(Uri.parse(
        //'http://192.168.121.202:3000/auth/signup'
        '$uri/auth/signup'
          //'http://localhost:3000/auth/signup'
      ),body: user.toJson()
          ,headers:<String,String>{
        'Content-Type':'application/json;charset=UTF-8',

          }
      );
      print('body.');
      print(res.body);
      httpErrorhandle(res: res, context: context, onsucess:(){
        snackbar(context, 'Account has been created');
      });

    }catch(e){
      snackbar(context, e.toString());

    }


  }
void getUserData(BuildContext context)async{
    try{
      SharedPreferences prefs=await SharedPreferences.getInstance();
      String? token =prefs.getString('x-auth-token');
      if(token==null)
        prefs.setString('x-auth-token', '');
var tokenRes=await http.post(Uri.parse('$uri/token'),
    headers: <String,String>{
      'Content-Type':'application/json; charset=UTF-8',
'x-auth-token':token!
    }
    );
var response=jsonDecode(tokenRes.body);
if(response==true){
http.Response userRes=await http.get(Uri.parse('$uri/'),
    headers: <String,String>{
  'Content-Type':'application/json;charset=UTF-8',
  'x-auth-token':token
});
var userProvider=Provider.of<UserProvider>(context,listen:false);
userProvider.setUser(userRes.body);
  //get user data
}
      //}

    }catch(e){

    }


}


  void signinUser({
    required BuildContext context,
    required String email,
    required String password,

  })async{
    try{


      http.Response res=await http.post(Uri.parse(
        //'http://192.168.121.202:3000/auth/signup'
          '$uri/auth/signin'
        //'http://localhost:3000/auth/signup'
      ),body: jsonEncode({
        'email':email,
        'password':password

      })
          ,headers:<String,String>{
            'Content-Type':'application/json;charset=UTF-8',

          }
      );

      httpErrorhandle(res: res, context: context, onsucess:()async{
        SharedPreferences preferences=await SharedPreferences.getInstance();
        Provider.of<UserProvider>(context,listen:false).setUser(res.body);
        await preferences.setString('x-auth-token',
            jsonDecode(res.body)['token']);
      //  snackbar(context, 'login sucess');
        Navigator.pushNamedAndRemoveUntil(context,
            BottomBar.routeName, (route) => false);
      //  snackbar(context, 'login sucess');
      });

    }catch(e){
      snackbar(context, e.toString());

    }


  }
//


}