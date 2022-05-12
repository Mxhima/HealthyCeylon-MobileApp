import 'package:flutter/material.dart';
import '../Const/const.dart';

class CustomButton extends StatelessWidget {
  String? text;
  void Function()? onTap;

  CustomButton({
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: kMainColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              text!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  String? text;
  String? buttonText;
  void Function()? onTap;

  CustomTextButton({
    required this.onTap,
    required this.buttonText,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${text!} '),
          InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                buttonText!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
