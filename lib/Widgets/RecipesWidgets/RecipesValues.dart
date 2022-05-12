import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';

class RecipesValueText extends StatelessWidget {
  String? text;
  RecipesValueText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
        color: kMainColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
