import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';

class ProfileContainer extends StatelessWidget {
  Widget? child;
  ProfileContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: kMainColor),
      ),
      child: child,
    );
  }
}
