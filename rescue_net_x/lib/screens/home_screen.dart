import 'package:flutter/material.dart';
import 'sos_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RescueNet X')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 25,
            ),
          ),
          child: const Text(
            'EMERGENCY SOS',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SosScreen(), // ❌ no const
              ),
            );
          },
        ),
      ),
    );
  }
}
