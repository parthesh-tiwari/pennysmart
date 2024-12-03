import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Penny Smart"),
      ),
      body: const Center(
        child: Text("Welcome to Penny Smart"),
      ),
    );
  }
}
