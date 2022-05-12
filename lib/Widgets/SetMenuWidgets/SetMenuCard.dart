import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';
import 'package:healthy_ceylon/UI/Recipes.dart';

class SetMenuCard extends StatelessWidget {
  var data;
  String? value;
  void Function(String?)? onChanged;

  SetMenuCard({
    required this.data,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            content(context, 1,'Food 1','350'),
            content(context, 2,'Food 2','280'),
            content(context, 3,'Food 3','600'),
          ],
        ),
      ),
    );
  }

  Padding content(context, int id, String name, String cal){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Radio(value: id.toString(), groupValue: value, onChanged: onChanged,),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$cal Cal',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecipesPage()));
                }, icon: const Icon(Icons.arrow_forward_ios,color: kMainColor,),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
