import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';

class SetMenuText extends StatelessWidget {
  String? text;
  SetMenuText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 15, 0, 0),
        child: Text(
          text!, 
          style: const TextStyle(
            fontSize: 25,
            color: kMainColor,
            fontWeight: FontWeight.bold,
        ),),
    );
  }
}

