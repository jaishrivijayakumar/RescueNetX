import 'package:flutter/material.dart';

class CommunityHelpBoard extends StatelessWidget {
  const CommunityHelpBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F14),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Community Help Board',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _helpCard(
              icon: Icons.local_hospital,
              title: 'Medical Assistance',
            ),
            _helpCard(
              icon: Icons.food_bank,
              title: 'Food & Shelter',
            ),
            _helpCard(
              icon: Icons.directions_car,
              title: 'Transport Help',
            ),
            _helpCard(
              icon: Icons.volunteer_activism,
              title: 'Volunteer Support',
            ),
          ],
        ),
      ),
    );
  }

  Widget _helpCard({
    required IconData icon,
    required String title,
    String? description, // ✅ optional now
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Color(0xFF1C1C25), Color(0xFF101014)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.redAccent, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
