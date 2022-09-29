
import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
import 'package:untitled/screen/auth_screen.dart';
import 'package:untitled/widget/bottom_bar.dart';

Route<dynamic>generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:return MaterialPageRoute(settings: routeSettings,
        builder: (_)=> AuthScreen());
    case BottomBar.routeName:return MaterialPageRoute(settings: routeSettings,
        builder: (_)=> BottomBar());
    case Home.routeName:return MaterialPageRoute(settings: routeSettings,
        builder: (_)=> Home());
    default:return MaterialPageRoute(settings: routeSettings,
        builder: (_)=>const Scaffold(body: Center(child: Text('Error occured'),),));


  }

}