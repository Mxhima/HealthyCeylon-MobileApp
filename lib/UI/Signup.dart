import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';
import 'package:healthy_ceylon/UI/GetStarted.dart';
import 'package:healthy_ceylon/UI/Login.dart';
import 'package:healthy_ceylon/Widgets/Buttons.dart';
import 'package:healthy_ceylon/Widgets/ImageCover.dart';
import 'package:healthy_ceylon/Widgets/TextInput.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: ListView(
          children: [
            CoverImage(
              title: 'SIGNUP',
              image: 'images/signup.png',
              heightScale: 1.5,
            ),
            const SizedBox(height: 20),
            CustomTextInput(
              textEditingController: firstName,
              hintText: 'First Name',
              textInputType: TextInputType.name,
            ),
            CustomTextInput(
              textEditingController: lastName,
              hintText: 'Last Name',
              textInputType: TextInputType.name,
            ),
            CustomTextInput(
              textEditingController: email,
              hintText: 'Email',
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextInput(
              textEditingController: password,
              hintText: 'Password',
              obscureText: true,
            ),
            CustomTextInput(
              textEditingController: confirmPassword,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            CustomButton(onTap: () {signup();}, text: 'Sign Up'),
            CustomTextButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              buttonText: 'Login',
              text: 'Already have an account?',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signup() async {
    ///
    if(firstName.text.isEmpty || lastName.text.isEmpty || email.text.isEmpty || password.text.isEmpty || confirmPassword.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Fields cannot be blank'),
        ),
      );
      return;
    }

    ///
    if(password.text != confirmPassword.text){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords are not match!'),
        ),
      );
      return;
    }

    ///
    var pwd = md5.convert(utf8.encode(password.text)).toString();
    var url = Uri.parse('${web}signup_add.php?fname=${firstName.text}&lname=${lastName.text}&email=${email.text}&pwwd=${pwd}&APIkey=${APIkey}');
    var response = await http.post(url, body: {});

    ///
    if(response.statusCode != 200){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot Create Account!'),
        ),
      );
      return;
    }

    ///
    var url1 = Uri.parse('${web}login_retrieve.php?email=${email.text}&pwd=${pwd}&APIkey=${APIkey}');
    var response1 = await http.post(url, body: {});

    ///
    var data;
    if(response.statusCode == 200){
      data = jsonDecode(response.body);
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
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => GetStartedPage(uid: data[0]['uid'].toString(), name: data[0]['firstname'],)));
  }
}
