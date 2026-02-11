import 'dart:async';
import 'package:flutter/material.dart';
import '../models/notification_item.dart';

class NotificationProvider extends ChangeNotifier {
  final List<NotificationItem> _notifications = [];
  Timer? _timer;
  int _index = 0;

  List<NotificationItem> get notifications => _notifications;

  final List<NotificationItem> _pool = [
    NotificationItem(
      title: 'Blood Requirement',
      description: 'Urgent O+ blood needed at City Hospital',
      icon: Icons.bloodtype,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Flood Alert',
      description: 'Water level increased by 0.8 meters',
      icon: Icons.water,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Medical Camp',
      description: 'Free checkup at Apollo Clinic',
      icon: Icons.local_hospital,
      time: DateTime.now(),
    ),
  ];

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