import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pennysmart/widgets/appbar/circular_profil_pic.dart';

class AppbarProfile extends StatelessWidget {
  const AppbarProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    User? _user = FirebaseAuth.instance.currentUser;

    bool auth = _user == null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: !auth
          ? CircularProfilePic(
              photoUrl: _user.photoURL ?? "",
            )
          : CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: Icon(
                Icons.person,
                color: Colors.grey.shade800,
              ),
            ),
    );
  }
}
