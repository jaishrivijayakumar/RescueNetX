import 'dart:async';
import 'package:flutter/material.dart';
import '../models/notification_item.dart';

class NotificationProvider extends ChangeNotifier {
  final List<NotificationItem> _notifications = [];
  Timer? _timer;
  int _index = 0;

  List<NotificationItem> get notifications =>
      List.unmodifiable(_notifications);

  int get unreadCount => _notifications.length;

  /// 🔔 UNLIMITED notification pool
  final List<NotificationItem> _pool = [
    NotificationItem(
      title: 'Blood Requirement',
      description: 'Urgent O+ blood needed at City Hospital',
      icon: Icons.bloodtype,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Hospital Update',
      description: 'Emergency ward open at Apollo Clinic',
      icon: Icons.local_hospital,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Doctor Available',
      description: 'Cardiologist available at North Medical',
      icon: Icons.medical_services,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Flood Alert',
      description: 'Water level increased by 0.8 meters',
      icon: Icons.water,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Weather Update',
      description: 'Heavy rain expected for next 4 hours',
      icon: Icons.cloud,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Relief Camp',
      description: 'Relief camp opened near Railway Ground',
      icon: Icons.home,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Pet Rescue',
      description: 'Animal rescue ongoing in Zone‑3',
      icon: Icons.pets,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Missing Person',
      description: 'Missing report filed near River Road',
      icon: Icons.person_search,
      time: DateTime.now(),
    ),
  ];

  /// ✅ THIS METHOD WAS MISSING
  void startAutoNotifications() {
    _timer ??= Timer.periodic(const Duration(minutes: 3), (_) {
      final item = _pool[_index % _pool.length];

      _notifications.insert(
        0,
        NotificationItem(
          title: item.title,
          description: item.description,
          icon: item.icon,
          time: DateTime.now(),
        ),
      );

      _index++;
      notifyListeners();
    });
  }

  void remove(NotificationItem item) {
    _notifications.remove(item);
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
