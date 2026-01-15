import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/enter_details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/community_help_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkIfRegistered() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isRegistered') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RescueNetX',
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
      ),

      // ✅ ROUTES
      routes: {
        '/home': (context) => const HomeScreen(),
        '/community': (context) => const CommunityHelpBoard(),
      },

      home: FutureBuilder<bool>(
        future: _checkIfRegistered(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return snapshot.data!
              ? const HomeScreen()
              : const EnterDetailsScreen();
        },
      ),
    );
  }
}
