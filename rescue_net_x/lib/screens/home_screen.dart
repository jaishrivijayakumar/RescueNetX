import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  String name = '';
  String location = '';

  late AnimationController _sosController;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _loadUserData();

    _sosController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _pulse = Tween<double>(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _sosController, curve: Curves.easeInOut),
    );
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      location = prefs.getString('location') ?? 'Not set';
    });
  }

  void _sendSOS() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('SOS Alert Sent! Help is on the way'),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  Widget _featureBubble(
    IconData icon,
    String label, {
    VoidCallback? onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C25),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.redAccent, size: 32),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F14),
      body: SafeArea(
        child: Column(
          children: [
            /// TOP BAR
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shield_rounded,
                      color: Colors.redAccent, size: 32),
                  SizedBox(width: 10),
                  Text(
                    'RescueNetX',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),

            /// LOCATION
            Text(
              '📍 $location',
              style: const TextStyle(color: Colors.white70),
            ),

            const Spacer(),

            /// FEATURES + SOS
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _featureBubble(
                      Icons.local_hospital,
                      'Medical Emergency',
                    ),
                    _featureBubble(
                      Icons.food_bank,
                      'Food & Water Support',
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// SOS BUTTON
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: _sendSOS,
                    child: ScaleTransition(
                      scale: _pulse,
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.redAccent.withOpacity(0.6),
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'SOS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _featureBubble(
                      Icons.home_rounded,
                      'Shelter Finder',
                    ),
                    _featureBubble(
                      Icons.groups,
                      'Community Help Board',
                      onTap: () {
                        Navigator.pushNamed(context, '/community');
                      },
                    ),
                  ],
                ),
              ],
            ),

            const Spacer(),

            /// FOOTER
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Stay Safe, $name!',
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sosController.dispose();
    super.dispose();
  }
}
