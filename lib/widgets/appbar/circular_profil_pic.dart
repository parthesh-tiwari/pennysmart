import 'package:flutter/material.dart';

class CircularProfilePic extends StatelessWidget {
  const CircularProfilePic({super.key, required this.photoUrl});
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: 36,
      height: 36,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Image.network(
          photoUrl ?? "",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
