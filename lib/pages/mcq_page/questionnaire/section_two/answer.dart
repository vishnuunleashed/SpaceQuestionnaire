import 'package:flutter/material.dart';

class Answer extends StatelessWidget {


  final String? answerText;
  final Color? answerColor;
  final answerTap;

  Answer({this.answerText,this.answerColor,this.answerTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(

        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: answerColor == null ? Colors.white : answerColor,
            border: Border.all(color: Colors.cyan),
            borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          answerText.toString(),
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ),
      ),
    );
  }
}
