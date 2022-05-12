import 'package:flutter/material.dart';

class CustomCheckboxListTile extends StatelessWidget {
  String? text;
  bool? value;
  void Function(bool?)? onChanged;

  CustomCheckboxListTile({
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CheckboxListTile(
        title: Text(text!),
        value: value,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
