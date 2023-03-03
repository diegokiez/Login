import 'package:flutter/material.dart';

class WidgetLabel extends StatelessWidget {
  final String text;
  const WidgetLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(45, 10, 0, 0),
      child: SizedBox(
          width: 90,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          )),
    );
  }
}
