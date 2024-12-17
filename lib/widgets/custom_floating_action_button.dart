import 'package:flutter/material.dart';
import 'package:pennysmart/utils/SystemHelper.dart';

import '../constants/app_themes.dart';

class HomePageFloatingActionButton extends StatelessWidget {
  const HomePageFloatingActionButton(
      {super.key, this.addInFolder = false, this.folderId});

  final bool addInFolder;
  final String? folderId;

  void _onClickNavButton(BuildContext context) {
    SystemHelper.statusBarColorChange(color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    LinearGradient? activeGradient =
        AppthemesData.getThemeWiseGradient(context);

    return Container(
      height: 70,
      width: 70,
      decoration:
          BoxDecoration(shape: BoxShape.circle, gradient: activeGradient),
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          shape: const CircleBorder(),
          onPressed: () => _onClickNavButton(context),
          elevation: 0,
          child: const Icon(
            size: 25.0,
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
