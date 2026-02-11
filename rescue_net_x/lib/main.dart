import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/community_help_board.dart';
import 'screens/notifications_screen.dart';
import 'screens/food_water_support.dart';
import 'screens/shelter_finder.dart';
import 'screens/medical_emergency.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RescueNetX',
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/community': (context) => const CommunityHelpBoard(),
        '/notifications': (context) => const NotificationsScreen(),
        '/food': (context) => const FoodWaterSupport(),
        '/shelter': (context) => const ShelterFinder(),
        '/emergency': (context) => const MedicalEmergency(),
      },
      home: const HomeScreen(),
    );
  }
}