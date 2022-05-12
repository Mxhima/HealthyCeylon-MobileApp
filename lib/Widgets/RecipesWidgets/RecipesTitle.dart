import 'package:flutter/material.dart';

class RecipesTitleText extends StatelessWidget {
  String? text;
  RecipesTitleText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${text!}: ',
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
