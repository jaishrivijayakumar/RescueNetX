// Home screen - P1 UI
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text(
          'Welcome to RescueNet X',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
