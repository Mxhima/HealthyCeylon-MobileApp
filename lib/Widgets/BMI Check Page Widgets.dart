import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';

class WidgetDailyRequire extends StatelessWidget {
  String? value;
  WidgetDailyRequire({required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const Text(
              ' Cal/day',
              style: TextStyle(
                fontSize: 40,
                color: kMainColor,
              ),
            ),
          ],
        ),
        const Text(
          'Daily Requirement',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class WidgetBMR extends StatelessWidget {
  String? value;
  WidgetBMR({required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              ' Cal/day',
              style: TextStyle(
                fontSize: 20,
                color: kMainColor,
              ),
            ),
          ],
        ),
        const Text(
          'BMR',
          style: TextStyle(
            color: Colors.green,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class WidgetBMI extends StatelessWidget {
  String? value;
  WidgetBMI({required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              children: const [
                Text(
                  ' kg/m',
                  style: TextStyle(
                    fontSize: 20,
                    color: kMainColor,
                  ),
                ),
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 10,
                    color: kMainColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Text(
          'BMI',
          style: TextStyle(
            color: Colors.green,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
