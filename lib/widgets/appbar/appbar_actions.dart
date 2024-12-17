import 'package:flutter/material.dart';
import 'package:pennysmart/widgets/appbar/appbar_profile.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions(
      {super.key,
      this.showGetFree = true,
      this.iconButtonIcon = Icons.lock,
      this.showIconButton = false,
      this.onIconButtonClick = null});

  final bool showGetFree;
  final bool showIconButton;
  final IconData iconButtonIcon;
  final Function? onIconButtonClick;

  // Future<void> _showThemesBottomSheet(BuildContext context) async {
  //   await AppHelper.showCustomModalBottomSheet(
  //       context: context, widget: const ThemesListings(), height: 350);
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
      child: Row(
        children: [
          if (showIconButton)
            IconButton(
                onPressed: () {
                  if (onIconButtonClick != null) {
                    onIconButtonClick!();
                  }
                },
                icon: Icon(iconButtonIcon)),
          const AppbarProfile()
        ],
      ),
    );
  }
}
