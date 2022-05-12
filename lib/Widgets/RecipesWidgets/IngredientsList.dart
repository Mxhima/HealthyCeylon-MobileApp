import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ingredient('Sample 1'),
          ingredient('Sample 2'),
          ingredient('Sample 3'),
        ],
      ),
    );
  }

  Row ingredient(String name){
    return Row(
      children: [
        const Icon(Icons.arrow_forward, color: kMainColor),
        const SizedBox(width: 5),
        Text(
            name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
