import 'package:flutter/material.dart';
import 'package:healthy_ceylon/UI/GetStarted.dart';
import 'package:healthy_ceylon/UI/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Ceylon',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LoginPage(),
      //home: GetStartedPage(uid: '12',),
    );
  }
}
//1.67