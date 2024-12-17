import 'package:flutter/material.dart';
import 'package:pennysmart/constants/app_themes.dart';

class PageToggles extends StatelessWidget {
  const PageToggles({
    Key? key,
    required this.pages,
    required this.changePage,
    required this.selectedPage,
  }) : super(key: key);

  final Map<String, dynamic> pages;
  final Function(String) changePage;
  final String selectedPage;

  @override
  Widget build(BuildContext context) {
    LinearGradient gradient = AppthemesData.getThemeWiseGradient(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: pages.entries.map((entry) {
          final String index = entry.key;
          return GestureDetector(
            onTap: () {
              changePage(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: Container(
                decoration: BoxDecoration(
                  gradient: index == selectedPage ? gradient : null,
                  borderRadius: BorderRadius.circular(20),
                  color: index == selectedPage ? null : Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Text(
                    index,
                    style: TextStyle(
                        color:
                            index == selectedPage ? Colors.white : Colors.black,
                        fontSize: 13),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
