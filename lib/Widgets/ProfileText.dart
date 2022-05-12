import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';
import 'package:healthy_ceylon/UI/Recipes.dart';

class ProfileTextTile extends StatelessWidget {
  String? text;
  ProfileTextTile({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text!,
        style: const TextStyle(
          color: kMainColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProfileTextValue extends StatelessWidget {
  String? text;
  int? id;
  
  ProfileTextValue({
    required this.text,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text('${text!} ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Visibility(
            visible: id != null,
            child: InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipesPage()));
              },
              child: const Icon(Icons.open_in_new,size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
