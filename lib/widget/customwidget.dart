import 'package:flutter/material.dart';

class CostomButton extends StatelessWidget {
  String text;
  VoidCallback ontap;
  Color? color;
  CostomButton({required this.text, required this.ontap, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          backgroundColor: color, minimumSize: Size(double.infinity, 42)),
    );
  }
}
