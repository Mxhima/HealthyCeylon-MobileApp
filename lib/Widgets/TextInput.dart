import 'package:flutter/material.dart';
import '../Const/const.dart';

class CustomTextInput extends StatelessWidget {
  TextEditingController? textEditingController;
  String? hintText;
  TextInputType? textInputType;
  bool? obscureText;

  CustomTextInput({
    required this.textEditingController,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: TextField(
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: obscureText!,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: kMainColor),
          ),
        ),
      ),
    );
  }
}
