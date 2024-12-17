import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:pennysmart/models/logged_in_user_data.dart';

class AuthServiceProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        "151083432541-e62rks2mcpkjh3q52edkdbsc6fa80bb4.apps.googleusercontent.com",
  );

  GoogleSignInAccount? _user;
  auth.AuthClient? _client;

  GoogleSignInAccount? get user => _user;

  Future<LoggedInUserData?> signInUsingGoogle() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account == null) {
        return null;
      }

      _user = account;

      final GoogleSignInAuthentication googleAuth =
          await account.authentication;

      final client = await authenticatedClient(
          oauthTokenString: googleAuth.accessToken, scopes: []);

      _client = client;

      final OAuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credentials);

      LoggedInUserData userData = LoggedInUserData(
          displayName: account.displayName ?? "",
          email: account.email,
          id: account.id,
          photoUrl: account.photoUrl ?? "");

      notifyListeners();

      return userData;
    } catch (e) {
      return null;
    }
  }

  Future<void> logOut() async {
    try {
      await _googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<auth.AuthClient?> authenticatedClient({
    String? oauthTokenString,
    List<String>? scopes,
  }) async {
    if (oauthTokenString == null) {
      return null;
    }
    final auth.AccessCredentials credentials = auth.AccessCredentials(
      auth.AccessToken(
        'Bearer',
        oauthTokenString,
        DateTime.now().toUtc().add(const Duration(days: 365)),
      ),
      null,
      scopes ?? [],
    );

    return auth.authenticatedClient(http.Client(), credentials);
  }
}
