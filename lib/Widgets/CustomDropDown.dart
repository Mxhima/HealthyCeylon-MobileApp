import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  String? hintText;
  String? selectedType;
  List<String>? types;
  void Function(String?)? onChanged;

  CustomDropDown({
    required this.hintText,
    required this.selectedType,
    required this.types,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: SizedBox(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hintText!,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              DropdownButton(
                underline: const SizedBox(),
                value: selectedType,
                onChanged: onChanged,
                items: types!.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
