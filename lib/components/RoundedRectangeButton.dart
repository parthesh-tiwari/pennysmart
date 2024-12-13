import 'package:flutter/material.dart';

class Roundedrectangebutton extends StatelessWidget {
  final Function onPressed;
  final String btnText;

  const Roundedrectangebutton(
      {super.key, required this.onPressed, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () {
          onPressed();
        },
        child: Text(btnText));
  }
}
