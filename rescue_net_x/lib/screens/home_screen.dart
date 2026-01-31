import 'package:flutter/material.dart';
import 'community_help_board.dart';
import 'food_water_support.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'RescueNetX',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _card(
              context,
              title: 'Community Help Board',
              icon: Icons.groups,
              screen: const CommunityHelpBoard(),
            ),
            _card(
              context,
              title: 'Food & Water Support',
              icon: Icons.fastfood,
              screen: const FoodWaterSupport(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget screen,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF1C1C25), Color(0xFF101014)],
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.redAccent, size: 30),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
