import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';

class AllergensList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          allergens('Sample 1'),
          allergens('Sample 2'),
        ],
      ),
    );
  }

  Row allergens(String name){
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
