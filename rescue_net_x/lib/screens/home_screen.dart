import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget featureButton(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.red, width: 2),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red, fontSize: 10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// LOCATION (Top Center)
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(height: 4),
                Text(
                  "Current Location",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),

          /// NOTIFICATION BELL (Top Right)
          Positioned(
            top: 50,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.notifications, color: Colors.red),
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
            ),
          ),

          /// CENTER AREA
          /// CENTER AREA
Center(
  child: SizedBox(
    height: 320,
    width: 320,
    child: Stack(
      alignment: Alignment.center,
      children: [

        /// TOP LEFT
        Positioned(
          left: 0,
          top: 0,
          child: featureButton("Community", () {
            Navigator.pushNamed(context, '/community');
          }),
        ),

        /// TOP RIGHT
        Positioned(
          right: 0,
          top: 0,
          child: featureButton("Food\nWater", () {
            Navigator.pushNamed(context, '/food');
          }),
        ),

        /// BOTTOM LEFT
        Positioned(
          left: 0,
          bottom: 0,
          child: featureButton("Shelter", () {
            Navigator.pushNamed(context, '/shelter');
          }),
        ),

        /// BOTTOM RIGHT
        Positioned(
          right: 0,
          bottom: 0,
          child: featureButton("Emergency", () {
            Navigator.pushNamed(context, '/emergency');
          }),
        ),

        /// SOS BUTTON (CENTER)
        ScaleTransition(
          scale: _scaleAnimation,
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Alert Sent to Nearby Rescuers 🚨"),
                ),
              );
            },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 3),
              ),
              alignment: Alignment.center,
              child: const Text(
                "SOS",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),
        ],
      ),
    );
  }
}