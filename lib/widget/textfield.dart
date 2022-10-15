import 'package:flutter/material.dart';

class TextFieldBox extends StatelessWidget {
  final TextEditingController controller;
  String hinttext;
  int line;

  TextFieldBox(
      {Key? key,
      required this.controller,
      required this.hinttext,
      this.line = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: line,
      controller: controller,
      decoration: InputDecoration(
          hintText: hinttext,
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your $hinttext';
        }
        return null;
      },
    );
  }
}
