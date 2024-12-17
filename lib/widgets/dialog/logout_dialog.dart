import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pennysmart/utils/app_helper.dart';
import 'package:pennysmart/widgets/rounded_rectangle_button.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  bool isLoading = false;
  void setLoading(bool value) {
    if (mounted) {
      setState(() {
        isLoading = value;
      });
    }
  }

  Future<void> _handleLogout(BuildContext context) async {
    try {
      setLoading(true);

      await AppHelper.logoutUser(context);

      setLoading(false);

      if (mounted) {
        Navigator.of(context).pop();
      }

      Fluttertoast.showToast(msg: "Logged out successfully");
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(14, 0, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.logout_outlined,
                size: 28,
                color: Colors.black,
              ),
              Text(
                " Logout",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Are you sure you want to logout from the app ?",
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            isLoading
                ? const CircularProgressIndicator.adaptive()
                : RoundedRectangleButton(
                    onButtonPressed: () => _handleLogout(context),
                    title: "Logout",
                    fontSize: 14,
                    verticalPadding: 4,
                    horzPadding: 12,
                  )
          ])
        ],
      ),
    );
  }
}
