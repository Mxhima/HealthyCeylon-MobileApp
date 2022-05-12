import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/Days.dart';
import 'package:healthy_ceylon/UI/SetMenu.dart';
import 'package:healthy_ceylon/Widgets/Buttons.dart';
import 'package:healthy_ceylon/Widgets/CustomDropDown.dart';
import 'package:healthy_ceylon/Widgets/ImageCover.dart';
import 'package:healthy_ceylon/Widgets/ProfileContainers.dart';
import 'package:healthy_ceylon/Widgets/ProfileText.dart';
import 'package:http/http.dart' as http;

import '../Const/const.dart';

class ProfilePage extends StatefulWidget {
  String name = 'Loading..';
  var data;
  var meal;

  ProfilePage(name, data, meal){
    this.name = name;
    this.data = data;
    this.meal = meal;
  }

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String
      name = 'Loading..',
      age = 'Loading..',
      gender = 'Loading..',
      weight = 'Loading..',
      height = 'Loading..',
      bmi = 'Loading..',
      bmr = 'Loading..',
      dcr = 'Loading..';

  Foods
    breakfast = Foods(),
    lunch = Foods(),
    snack = Foods(),
    dinner = Foods();

  String selectedDayNum = dayNum[0];

  @override
  void initState() {
    setState(() {
      name = widget.name;
      age = widget.data[0]['age'];
      gender = widget.data[0]['gender'];
      weight = widget.data[0]['weight'];
      height = widget.data[0]['height'];
      bmi = widget.data[0]['BMI'];
      bmr = widget.data[0]['BMR'];
      dcr = widget.data[0]['caloriecount'];

      if(widget.meal.toString() == '[]'){
        breakfast.name = 'N/A';
        lunch.name = 'N/A';
        snack.name = 'N/A';
        dinner.name = 'N/A';
      }
      else{

      }
    });
    super.initState();
  }

  Future<void> getMeal() async {
    ///
    var url = Uri.parse('${web}profile_mobile.php?uid=${widget.data[0]['uid']}&day=${selectedDayNum}&APIkey=${APIkey}');
    var response = await http.post(url, body: {});

    ///
    if(response.statusCode == 200){
      var meal = await jsonDecode(response.body);
      //
     }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.statusCode} Error'),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async => false,
        child: Scaffold(
          appBar: AppBar(toolbarHeight: 0),
          body: ListView(
            children: [
              CoverImage(
                title: name,
                image: 'images/profile.png',
                heightScale: 1.5,
              ),
              profileDetails(),
              profileFoods(),
              CustomButton(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SetMenuPage(widget.data[0]['uid'])));
              }, text: 'Add Meal Plan'),
            ],
          ),
        ),
    );
  }

  ProfileContainer profileDetails(){
    return ProfileContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileTextTile(text: 'Age'),
                ProfileTextTile(text: 'Gender'),
                ProfileTextTile(text: 'Weight'),
                ProfileTextTile(text: 'Height'),
                ProfileTextTile(text: 'BMI'),
                ProfileTextTile(text: 'BMR'),
                ProfileTextTile(text: 'DCR'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileTextValue(text: age),
                ProfileTextValue(text: gender),
                ProfileTextValue(text: weight),
                ProfileTextValue(text: height),
                ProfileTextValue(text: bmi),
                ProfileTextValue(text: bmr),
                ProfileTextValue(text: dcr),
              ],
            ),
          ],
        ),
    );
  }

  ProfileContainer profileFoods(){
    return ProfileContainer(
      child: Column(
        children: [
          CustomDropDown(
            hintText: 'Day',
            selectedType: selectedDayNum,
            types: dayNum,
            onChanged: (value){
              setState(() {
                selectedDayNum = value.toString();
              });
              getMeal();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileTextTile(text: 'Breakfast'),
                  ProfileTextTile(text: 'Lunch'),
                  ProfileTextTile(text: 'Snack'),
                  ProfileTextTile(text: 'Dinner'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileTextValue(text: breakfast.name, id: 1),
                  ProfileTextValue(text: lunch.name, id: 2),
                  ProfileTextValue(text: snack.name, id: 3),
                  ProfileTextValue(text: dinner.name, id: 4),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Foods{
  int? id;
  String? name = 'Loading..';
}
