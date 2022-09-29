import 'package:flutter/material.dart';


class CostomButton extends StatelessWidget {
  String text;
  VoidCallback ontap;
  CostomButton({Key? key,required this.text,required this.ontap}) ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ontap, child: Text(text),style: ElevatedButton.styleFrom(

        minimumSize: Size(double.infinity, 42)
    ),);
  }
}
