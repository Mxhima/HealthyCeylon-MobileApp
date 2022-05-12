import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/Allergens.dart';
import 'package:healthy_ceylon/Const/DropDownLists.dart';
import 'package:healthy_ceylon/UI/BMIcheck.dart';
import 'package:healthy_ceylon/Widgets/Buttons.dart';
import 'package:healthy_ceylon/Widgets/CheckboxListTile.dart';
import 'package:healthy_ceylon/Widgets/CustomDropDown.dart';
import 'package:healthy_ceylon/Widgets/ImageCover.dart';
import 'package:healthy_ceylon/Widgets/TextInput.dart';
import 'package:healthy_ceylon/Const/const.dart';
import 'package:http/http.dart' as http;

class GetStartedPage extends StatefulWidget {
  String? uid;
  String? name;
  GetStartedPage({required this.uid, required this.name});

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

  String gender = kDropDownGender[0];
  String primaryDiet = kDropDownPrimaryDiet[0];
  String bodyFat = kDropDownBodyFat[0];
  String activityLevel = kDropDownActivityLevel[0];

  Allergens allergens = Allergens();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: ListView(
          children: [
            CoverImage(
              title: 'Get Started',
              image: 'images/getStarted.png',
              heightScale: 1.5,
            ),
            const SizedBox(height: 20),

            /// TextInput
            CustomTextInput(
              textEditingController: age,
              hintText: 'Age',
              textInputType: TextInputType.number,
            ),
            CustomDropDown(
              hintText: 'Gender',
              selectedType: gender,
              types: kDropDownGender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            CustomTextInput(
              textEditingController: weight,
              hintText: 'Weight in Kg',
              textInputType: TextInputType.number,
            ),
            CustomTextInput(
              textEditingController: height,
              hintText: 'Height in m',
              //textInputType: TextInputType.number,
            ),
            CustomDropDown(
              hintText: 'Primary Diet',
              selectedType: primaryDiet,
              types: kDropDownPrimaryDiet,
              onChanged: (value) {
                setState(() {
                  primaryDiet = value.toString();
                });
              },
            ),
            CustomDropDown(
              hintText: 'Body Fat',
              selectedType: bodyFat,
              types: kDropDownBodyFat,
              onChanged: (value) {
                setState(() {
                  bodyFat = value.toString();
                });
              },
            ),
            CustomDropDown(
              hintText: 'Activity Level',
              selectedType: activityLevel,
              types: kDropDownActivityLevel,
              onChanged: (value) {
                setState(() {
                  activityLevel = value.toString();
                });
              },
            ),

            /// Allergens
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 25, 0, 10),
              child: Text(
                'Allergens',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /// Checkboxes
            Row(
              children: [
                CustomCheckboxListTile(
                  text: 'Peanut',
                  value: allergens.peanut,
                  onChanged: (newValue) {
                    setState(() {
                      allergens.peanut = newValue;
                    });
                  },
                ),
                CustomCheckboxListTile(
                  text: 'Egg',
                  value: allergens.egg,
                  onChanged: (newValue) {
                    setState(() {
                      allergens.egg = newValue;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                CustomCheckboxListTile(
                  text: 'Dairy',
                  value: allergens.dairy,
                  onChanged: (newValue) {
                    setState(() {
                      allergens.dairy = newValue;
                    });
                  },
                ),
                CustomCheckboxListTile(
                  text: 'Fish',
                  value: allergens.fish,
                  onChanged: (newValue) {
                    setState(() {
                      allergens.fish = newValue;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                CustomCheckboxListTile(
                  text: 'Soy',
                  value: allergens.soy,
                  onChanged: (newValue) {
                    setState(() {
                      allergens.soy = newValue;
                    });
                  },
                ),
                CustomCheckboxListTile(
                  text: 'Wheat',
                  value: allergens.wheat,
                  onChanged: (newValue) {
                    setState(() {
                      allergens.wheat = newValue;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                CustomCheckboxListTile(
                  text: 'Sesame',
                  value: allergens.sesame,
                  onChanged: (newValue) {
                    setState(() {
                      allergens.sesame = newValue;
                    });
                  },
                ),
                CustomCheckboxListTile(
                  text: 'Seafood',
                  value: allergens.seafood,
                  onChanged: (newValue) {
                    setState(() {
                      allergens.seafood = newValue;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                CustomCheckboxListTile(
                  text: 'Mustard',
                  value: allergens.mustard,
                  onChanged: (newValue) {
                    setState(() {
                      allergens.mustard = newValue;
                    });
                  },
                ),
                CustomCheckboxListTile(
                  text: 'Nuts',
                  value: allergens.nuts,
                  onChanged: (newValue) {
                    setState(() {
                      allergens.nuts = newValue;
                    });
                  },
                ),
              ],
            ),

            /// Button
            CustomButton(onTap: () {Continue();}, text: 'Continue'),
          ],
        ),
      ),
    );
  }

  Future<void> Continue() async {
    ///
    if(age.text.isEmpty || height.text.isEmpty || weight.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Fields cannot be blank'),
        ),
      );
      return;
    }

    ///
    List<String> allergen = [];
    if(allergens.peanut!) {
      allergen.add('Peanut');
    }
    if(allergens.egg!) {
      allergen.add('Egg');
    }
    if(allergens.dairy!) {
      allergen.add('Dairy');
    }
    if(allergens.fish!) {
      allergen.add('Fish');
    }
    if(allergens.soy!){
      allergen.add('Soy');
    }
    if(allergens.wheat!){
      allergen.add('Wheat');
    }
    if(allergens.sesame!){
      allergen.add('Sesame');
    }
    if(allergens.seafood!){
      allergen.add('Seafood');
    }
    if(allergens.mustard!){
      allergen.add('Mustard');
    }
    if(allergens.nuts!){
      allergen.add('Nuts');
    }


    ///
    var url = Uri.parse('${web}getstarted_insert.php?age=${age.text}&gender=${gender}&weight=${weight.text}&height=${height.text}&diet=${primaryDiet}&fat=${bodyFat}&activity=${activityLevel}&allergens=${jsonEncode(allergen)}&uid=${widget.uid}&APIkey=${APIkey}');
    var response = await http.post(url, body: {});

    // var url = Uri.parse('${web}getstarted_insert.php');
    // var response = await http.post(url, body: {
    //   'age': age.text,
    //   'gender': gender,
    //   'weight': weight.text,
    //   'height': height.text,
    //   'diet':primaryDiet,
    //   'fat':bodyFat,
    //   'activity':activityLevel,
    //   'allergens':allergen.toString(),
    //   'uid':widget.uid,
    //   'APIkey':APIkey,
    // });


    ///
    if(response.statusCode != 200){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot Continue!'),
        ),
      );
      return;
    }
    getData();
  }

  Future<void> getData() async {
    ///
    var url = Uri.parse('${web}analysis_select.php?uid=${widget.uid}&APIkey=${APIkey}');
    var response = await http.post(url, body: {});

    ///
    if(response.statusCode == 200){
      var data = await jsonDecode(response.body);
      Navigator.push(context, MaterialPageRoute(builder: (context) => BMIcheckPage(widget.name, data)));
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
}
