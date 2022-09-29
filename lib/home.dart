import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/user_provider.dart';

class Home extends StatefulWidget {
  static const String routeName='/home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserProvider>(context,listen:false).user;
    return Container(child:Text(user.toJson()));
  }
}
