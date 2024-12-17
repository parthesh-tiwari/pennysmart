import 'package:flutter/material.dart';
import 'package:pennysmart/constants/app_themes.dart';

class RoundedRectangleButton extends StatelessWidget {
  const RoundedRectangleButton({
    Key? key,
    required this.onButtonPressed,
    required this.title,
    this.fontSize = 18.0,
    this.verticalPadding = 14.0,
    this.horzPadding = 36.0,
  }) : super(key: key);

  final Function() onButtonPressed;
  final String title;
  final double fontSize;
  final double horzPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    LinearGradient gradient = AppthemesData.getThemeWiseGradient(context);

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: MaterialButton(
        onPressed: onButtonPressed,
        color: Colors.transparent,
        textColor: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horzPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        elevation: 0,
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
