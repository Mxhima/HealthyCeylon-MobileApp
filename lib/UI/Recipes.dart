import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Widgets/Buttons.dart';
import 'package:healthy_ceylon/Widgets/ImageCover.dart';
import 'package:healthy_ceylon/Widgets/RecipesWidgets/AllergensList.dart';
import 'package:healthy_ceylon/Widgets/RecipesWidgets/IngredientsList.dart';
import 'package:healthy_ceylon/Widgets/RecipesWidgets/RecipesTitle.dart';
import 'package:healthy_ceylon/Widgets/RecipesWidgets/RecipesValues.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipesPage extends StatefulWidget {

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  String
    name = 'Loading..',
    calories = 'Loading..',
    protein = 'Loading..',
    url = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: ListView(
        children: [
          CoverImage(
            title: name,
            image: 'images/recipes.png',
            heightScale: 1.5,
            backButton: true,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RecipesTitleText(text: 'Calories'),
                    RecipesValueText(text: calories),
                  ],
                ),
                const SizedBox(height: 15),

                ///
                Row(
                  children: [
                    RecipesTitleText(text: 'Protein'),
                    RecipesValueText(text: protein),
                  ],
                ),
                const SizedBox(height: 15),

                ///
                RecipesTitleText(text: 'Ingredients'),
                IngredientsList(),
                const SizedBox(height: 15),

                ///
                RecipesTitleText(text: 'Possible Allergens'),
                AllergensList(),
                const SizedBox(height: 15),

                ///
                Visibility(
                  visible: url != '',
                  child: CustomButton(onTap: () async{
                    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
                  }, text: 'See Full Recipe'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
