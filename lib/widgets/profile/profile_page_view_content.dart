import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pennysmart/utils/app_helper.dart';
import 'package:pennysmart/widgets/dialog/logout_dialog.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePageViewContent extends StatefulWidget {
  const ProfilePageViewContent(
      {super.key, this.user, required this.isLoggedIn});

  final User? user;
  final bool isLoggedIn;

  @override
  State<ProfilePageViewContent> createState() => _ProfilePageViewContentState();
}

class _ProfilePageViewContentState extends State<ProfilePageViewContent> {
  bool loading = false;

  Future<void> _handleLogin(BuildContext context) async {
    setLoading(true);
    await AppHelper.loginUser(context);
    setLoading(false);
  }

  Future<void> _handleLogout(BuildContext context) async {
    AppHelper.showCustomDialog(context: context, widget: const LogoutDialog());
  }

  void setLoading(bool isLoading) {
    if (mounted) {
      setState(() {
        loading = isLoading;
      });
    }
  }

  Future<void> _shareApp() async {
    try {
      await Share.share(
          "Checkout the Penny Smart App, a one stop solution for managing your expenses and income - your finance friend");
    } catch (e) {
      print(e);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    if (user != null)
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        width: 64,
                        height: 64,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Image.network(
                            user.photoURL ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    else
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        radius: 32,
                        child: Icon(
                          color: Colors.grey.shade600,
                          Icons.person,
                          size: 36,
                        ),
                      ),
                    const SizedBox(width: 16),
                    if (user == null)
                      TextButton(
                          onPressed: () => _handleLogin(context),
                          child: Text(
                            "Click to login",
                            style: TextStyle(
                                color: Colors.grey.shade900, fontSize: 18),
                          ))
                    else
                      Text(
                        user.displayName ?? "",
                        style: const TextStyle(fontSize: 18),
                      ),
                    if (user != null)
                      IconButton(
                          onPressed: () => _handleLogout(context),
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.black,
                          ))
                    else
                      IconButton(
                          onPressed: () => _handleLogin(context),
                          icon: const Icon(
                            Icons.login,
                            color: Colors.black,
                          ))
                  ],
                ),
              ],
            ),
          );
  }
}
