import 'package:flutter/material.dart';

class FoodWaterSupport extends StatelessWidget {
  const FoodWaterSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Food & Water Support'),
        backgroundColor: Colors.redAccent,
      ),
      body: const Center(
        child: Text(
          'Food & Water support requests will appear here',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
