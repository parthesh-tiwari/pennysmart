import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pennysmart/models/logged_in_user_data.dart';
import 'package:pennysmart/providers/auth_service_provider.dart';
import 'package:pennysmart/utils/SystemHelper.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AppHelper {
  static Uuid uuid = const Uuid();

  static Future<void> showCustomModalBottomSheet(
      {required BuildContext context,
      required Widget widget,
      double height = 400,
      Color? statusBarColor,
      Brightness iconBrightness = Brightness.dark,
      Color statusBarColorOnClose = Colors.white}) async {
    if (statusBarColor == null) {
      SystemHelper.statusBarColorChangeDefault();
    } else {
      SystemHelper.statusBarColorChangeDefault(
          statusBarColor: statusBarColor, brightness: iconBrightness);
    }

    await showModalBottomSheet(
      useRootNavigator: true,
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: widget,
        );
      },
    ).then(
      (value) {
        SystemHelper.statusBarColorChange(
            color: statusBarColorOnClose, brightness: iconBrightness);
      },
    );
  }

  static void showToast(
      {required BuildContext context,
      required String title,
      IconData icon = Icons.check_circle_outline_outlined,
      Color iconColor = Colors.black87}) {
    DelightToastBar(
            builder: (context) => ToastCard(
                  color: Colors.white,
                  leading: Icon(
                    icon,
                    size: 28,
                    color: iconColor,
                  ),
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
            position: DelightSnackbarPosition.top,
            autoDismiss: true,
            snackbarDuration: const Duration(seconds: 2))
        .show(context);
  }

  static void showCustomDialog({
    required BuildContext context,
    required Widget widget,
    String confirmButtonText = "Confirm",
    String cancelButtonText = "Cancel",
  }) async {
    SystemHelper.statusBarColorChangeDefault();

    await AwesomeDialog(
      context: context,
      useRootNavigator: true,
      animType: AnimType.bottomSlide,
      dialogType: DialogType.noHeader,
      body: widget,
    )
      ..show().then(
          (_) => {SystemHelper.statusBarColorChange(color: Colors.white)});
  }

  static String convetColorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
  }

  static String generateUniqueId() {
    return uuid.v1();
  }

  static Future<User?> loginUser(BuildContext context) async {
    try {
      final authProvider =
          Provider.of<AuthServiceProvider>(context, listen: false);

      LoggedInUserData? userData = await authProvider.signInUsingGoogle();

      User? user = FirebaseAuth.instance.currentUser;

      return user;
    } catch (e) {
      return null;
    }
  }

  static Future<void> logoutUser(BuildContext context) async {
    final authProvider =
        Provider.of<AuthServiceProvider>(context, listen: false);
    await authProvider.logOut();
  }
}
