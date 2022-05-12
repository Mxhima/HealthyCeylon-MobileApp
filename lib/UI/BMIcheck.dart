import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthy_ceylon/UI/Profile.dart';
import 'package:healthy_ceylon/Widgets/BMI%20Check%20Page%20Widgets.dart';
import 'package:healthy_ceylon/Widgets/Buttons.dart';
import 'package:healthy_ceylon/Const/const.dart';
import 'package:http/http.dart' as http;
import 'package:healthy_ceylon/Widgets/ImageCover.dart';

class BMIcheckPage extends StatefulWidget {
  var data;
  var name;
  BMIcheckPage(name, data){
    this.data = data;
    this.name;
  }

  @override
  _BMIcheckPageState createState() => _BMIcheckPageState();
}

class _BMIcheckPageState extends State<BMIcheckPage> {
  String dailyRequire = '0000', bmr = '0000', bmi = '0000';

  @override
  void initState() {
    setState(() {
      dailyRequire = widget.data[0]['caloriecount'];
      bmr = widget.data[0]['BMR'];
      bmi = widget.data[0]['BMI'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: ListView(
        children: [
          CoverImage(
            title: 'Daily Calorie Requirement',
            image: 'images/bmi.png',
            backButton: true,
          ),

          ///
          const SizedBox(height: 60),

          ///
          WidgetDailyRequire(value: dailyRequire),

          ///
          const SizedBox(height: 40),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WidgetBMR(value: bmr),
              WidgetBMI(value: bmi),
            ],
          ),

          ///
          const SizedBox(height: 70),

          ///
          CustomButton(onTap: () {proceed();}, text: 'Proceed'),
        ],
      ),
    );
  }
  Future<void> proceed() async {
    ///
    var url = Uri.parse('${web}profile_personaldata.php?uid=${widget.data[0]['uid']}&APIkey=${APIkey}');
    var response = await http.post(url, body: {});

    ///
    var data;
    if(response.statusCode == 200){
      data = await jsonDecode(response.body);
      //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(name, data)));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.statusCode} Error'),
        ),
      );
      return;
    }

    ///
    var url1 = Uri.parse('${web}profile_mobile.php?uid=${widget.data[0]['uid']}&day=1&APIkey=${APIkey}');
    var response1 = await http.post(url1, body: {});

    ///
    if(response1.statusCode == 200){
      var meal = await jsonDecode(response1.body);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(widget.name, data, meal)));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response1.statusCode} Error'),
        ),
      );
      return;
    }
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(uid: '')));
  }
}
