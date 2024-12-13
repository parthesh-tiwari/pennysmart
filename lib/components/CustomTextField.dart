import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  final bool isAutoFocus;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;

  const Customtextfield(
      {super.key,
      required this.isAutoFocus,
      required this.controller,
      required this.hintText,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: isAutoFocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText
      )
    );
  }
}
