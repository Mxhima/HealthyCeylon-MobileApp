import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/Days.dart';
import 'package:healthy_ceylon/Widgets/Buttons.dart';
import 'package:healthy_ceylon/Widgets/CustomDropDown.dart';
import 'package:healthy_ceylon/Widgets/SetMenuWidgets/SetMenuCard.dart';
import 'package:healthy_ceylon/Widgets/SetMenuWidgets/SetMenuText.dart';

class SetMenuPage extends StatefulWidget {
  var uid;
  SetMenuPage(uid){
    this.uid = uid;
  }

  @override
  _SetMenuPageState createState() => _SetMenuPageState();
}

class _SetMenuPageState extends State<SetMenuPage> {
  String selectedDayNum = dayNum[0];
  String _breakfast = '';
  String _lunch = '';
  String _snack = '';
  String _dinner = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          CustomDropDown(
            hintText: 'Day',
            selectedType: selectedDayNum,
            types: dayNum,
            onChanged: (value){
              setState(() {
                selectedDayNum = value.toString();
              });
            },
          ),

          ///
          SetMenuText(text: 'Breakfast'),
           SetMenuCard(
             data: '',
             value: _breakfast,
             onChanged: (value){
               setState(() {
                 _breakfast = value.toString();
               });
              },
           ),
          //
          SetMenuText(text: 'Lunch'),
          SetMenuCard(
            data: '',
            value: _lunch,
            onChanged: (value){
              setState(() {
                _lunch = value.toString();
              });
            },
          ),

          ///
          SetMenuText(text: 'Snack'),
          SetMenuCard(
            data: '',
            value: _snack,
            onChanged: (value){
              setState(() {
                _snack = value.toString();
              });
            },
          ),

          ///
          SetMenuText(text: 'Dinner'),
          SetMenuCard(
            data: '',
            value: _dinner,
            onChanged: (value){
              setState(() {
                _dinner = value.toString();
              });
            },
          ),

          ///
          CustomButton(onTap: (){}, text: 'Save',),

        ],
      ),
    );
  }
}

