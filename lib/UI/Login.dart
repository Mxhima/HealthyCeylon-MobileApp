import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';
import 'package:healthy_ceylon/UI/GetStarted.dart';
import 'package:healthy_ceylon/UI/Profile.dart';
import 'package:healthy_ceylon/UI/Signup.dart';
import 'package:healthy_ceylon/Widgets/Buttons.dart';
import 'package:healthy_ceylon/Widgets/ImageCover.dart';
import 'package:healthy_ceylon/Widgets/TextInput.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: ListView(
          children: [
            CoverImage(
              title: 'LOGIN',
              image: 'images/login.png',
            ),
            const SizedBox(height: 20),
            CustomTextInput(
              textEditingController: email,
              hintText: 'Email',
            ),
            CustomTextInput(
              textEditingController: password,
              hintText: 'Password',
              obscureText: true,
            ),
            CustomButton(onTap: () {
              login();
            }, text: 'Login'),
            CustomTextButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
              buttonText: 'Create',
              text: 'Don\'t have an account?',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    ///
    if(email.text.isEmpty || password.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Fields cannot be blank'),
        ),
      );
      return;
    }

    ///
    var pwd = md5.convert(utf8.encode(password.text)).toString();
    var url = Uri.parse('${web}login_retrieve.php?email=${email.text}&pwd=${pwd}&APIkey=${APIkey}');
    var response = await http.post(url, body: {});

    ///
    var data;
    if(response.statusCode == 200){
      data = jsonDecode(response.body);
      print(data);
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
    if(data.toString() == '[]'){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Attempt!'),
        ),
      );
      return;
    }


    getData(data[0]['uid'],data[0]['firstname']);
  }

  Future<void> getData(id, name) async {
    ///
    var url = Uri.parse('${web}profile_personaldata.php?uid=${id}&APIkey=${APIkey}');
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
    var url1 = Uri.parse('${web}profile_mobile.php?uid=${id}&day=1&APIkey=${APIkey}');
    var response1 = await http.post(url1, body: {});

    ///
    if(response1.statusCode == 200){
      var meal = await jsonDecode(response1.body);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(name, data, meal)));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response1.statusCode} Error'),
        ),
      );
      return;
    }
  }
}
