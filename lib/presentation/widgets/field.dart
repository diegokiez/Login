import 'package:flutter/material.dart';

class WidgetField extends StatelessWidget {
  final String text;
  final bool obscure;
  final TextInputType keyboard;
  Function function;
  WidgetField({
    super.key,
    required this.text,
    required this.function,
    this.obscure = false,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 20, 45, 0),
      child: TextFormField(
          keyboardType: keyboard,
          obscureText: obscure,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintText: text,
              hintStyle: const TextStyle(fontSize: 20),
              constraints: const BoxConstraints(maxWidth: 250, maxHeight: 50),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          onChanged: (value) => {function(value)}),
    ));
  }
}
