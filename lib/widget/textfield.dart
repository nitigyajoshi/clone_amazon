import 'package:flutter/material.dart';
class TextFieldBox extends StatelessWidget {
  final TextEditingController controller;
  String hinttext;


  TextFieldBox({Key? key,required this.controller,required this.hinttext}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      decoration:InputDecoration(hintText: hinttext,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black
              )

          ),
          enabledBorder:OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black
              )
          )
      ) ,
      validator: (value)
      {
        if(value==null||value.isEmpty){
          return 'Enter your $hinttext';
        }
        return null;

      },
    );
  }

}