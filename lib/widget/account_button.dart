import 'package:flutter/material.dart';
class AccountButton extends StatelessWidget {
  String text;
  VoidCallback onTap;
   AccountButton({required this.text,required
   this.onTap}) ;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
     padding: const EdgeInsets.only(top:8.0),
     child:
    Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 40,
        width: 150,
        decoration: BoxDecoration(
border: Border.all(
  color: Colors.white10,width: 1.0,
),borderRadius: BorderRadius.circular(150),
          color: Colors.white

        ),
child: OutlinedButton(style: ElevatedButton.styleFrom(shape:
RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
  child: Text(text,style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal)
    ,),onPressed: onTap,

),
      ));
    //);
  }
}
