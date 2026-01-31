import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'screens/enter_details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/community_help_board.dart';
import 'providers/notification_provider.dart';
import 'screens/notifications_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) {
<<<<<<< HEAD
        final p = NotificationProvider();
        p.startAutoNotifications();
        return p;
=======
        final provider = NotificationProvider();
        provider.startAutoNotifications(); // ✅ NOW EXISTS
        return provider;
>>>>>>> 02655a717726928bd2ed25a1901708364559916c
      },
      child: const MyApp(),
    ),
  );
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

      // ✅ ROUTES — THIS MUST MATCH EXACTLY
      routes: {
        '/home': (context) => const HomeScreen(),
        '/community': (context) => const CommunityHelpBoard(),
        '/notifications': (context) => const NotificationsScreen(),
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