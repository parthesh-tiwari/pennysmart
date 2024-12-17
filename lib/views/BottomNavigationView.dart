import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pennysmart/widgets/navbar/curved_navigation_bar.dart';
import 'package:pennysmart/constants/app_themes.dart';
import 'package:pennysmart/utils/NavigationHelper.dart';
import 'package:pennysmart/utils/SystemHelper.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int index = 0;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index);
    Color statusBarColor = NavigatorHelper.getStatusBarColor(context, index);

    if (index == 1) {
      SystemHelper.statusBarColorChangeWithBrightness(
          statusBarColor, Brightness.light);
    } else {
      SystemHelper.statusBarColorChange(color: statusBarColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color activeColor = Theme.of(context).primaryColor;

    Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    Color inactiveIconColor = Colors.grey.shade500;

    LinearGradient gradient = AppthemesData.getThemeWiseGradient(context);

    return SafeArea(
        child: ClipRRect(
      child: Scaffold(
        body: widget.navigationShell,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: backgroundColor),
          child: CustomCurvedNavigationBar(
            linearGradient: gradient,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: activeColor,
            height: 60,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color:
                    index.toString() == "0" ? Colors.white : inactiveIconColor,
              ),
              Icon(Icons.calendar_month,
                  size: 30,
                  color: index.toString() == "1"
                      ? Colors.white
                      : inactiveIconColor),
              Icon(
                Icons.search,
                size: 30,
                color:
                    index.toString() == "2" ? Colors.white : inactiveIconColor,
              ),
              Icon(
                Icons.person,
                size: 30,
                color:
                    index.toString() == "3" ? Colors.white : inactiveIconColor,
              ),
            ],
            onTap: (idx) => setState(() {
              setState(() {
                index = idx;
              });
              _goToBranch(idx);
            }),
          ),
        ),
      ),
    ));
  }
}
