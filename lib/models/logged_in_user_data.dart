class LoggedInUserData {
  String displayName;
  String photoUrl;
  String email;
  String id;
  bool isPremiumUser = false;

  LoggedInUserData(
      {required this.displayName,
      required this.photoUrl,
      required this.email,
      required this.id});
}
