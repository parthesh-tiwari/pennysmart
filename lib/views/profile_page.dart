import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pennysmart/widgets/appbar/appbar_actions.dart';
import 'package:pennysmart/widgets/profile/profile_page_view_content.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(54.0),
            child: AppBar(
              title: const Text("My Profile"),
              actions: const [AppBarActions()],
            ),
          ),
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return ProfilePageViewContent(
                isLoggedIn: snapshot.hasData && snapshot.data != null,
                user: snapshot.data,
              );
            },
          )),
    );
  }
}
