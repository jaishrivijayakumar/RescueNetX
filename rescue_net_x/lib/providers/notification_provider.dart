<<<<<<< HEAD
// lib/providers/notification_provider.dart
=======
>>>>>>> 02655a717726928bd2ed25a1901708364559916c
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/notification_item.dart';

class NotificationProvider extends ChangeNotifier {
<<<<<<< HEAD
  final List<NotificationItem> _stored = [];
  final List<NotificationItem> _active = [];

  Timer? _timer;
  int _index = 0;

  int get unreadCount => _stored.length;
  List<NotificationItem> get storedNotifications =>
      _stored.reversed.toList();
  List<NotificationItem> get activeNotifications => _active;

  /// ALL TYPES OF NEWS (ROTATES)
  final List<NotificationItem> _news = [
    NotificationItem(
      title: 'Blood Requirement',
      message: 'Urgent O+ blood needed at City Hospital',
      icon: Icons.bloodtype,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Nearby Hospital',
      message: 'Emergency ward open at Apollo Clinic',
      icon: Icons.local_hospital,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Doctor Update',
      message: 'Cardiologist available at North Medical',
      icon: Icons.medical_services,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Flood Alert',
      message: 'Water level increased by 0.8 meters',
      icon: Icons.water,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Weather Update',
      message: 'Heavy rain expected for next 4 hours',
      icon: Icons.cloud,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Relief Camp',
      message: 'Relief camp opened near Railway Ground',
      icon: Icons.volunteer_activism,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Pet Rescue',
      message: 'Animal rescue ongoing in Zone‑3',
      icon: Icons.pets,
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Missing Person',
      message: 'Missing report filed near River Road',
      icon: Icons.person_search,
      time: DateTime.now(),
    ),
    // ➕ YOU CAN KEEP ADDING (NO LIMIT)
  ];

  void start() {
    _timer ??= Timer.periodic(const Duration(minutes: 3), (_) {
      _pushNotification();
    });
  }

  void _pushNotification() {
    final item = _news[_index % _news.length];
    final newItem = NotificationItem(
      title: item.title,
      message: item.message,
      icon: item.icon,
      time: DateTime.now(),
    );

    _active.add(newItem);
    notifyListeners();

    // auto dismiss after 5 seconds
    Timer(const Duration(seconds: 5), () {
      dismissActive(newItem);
    });

    _index++;
  }

  void dismissActive(NotificationItem item) {
    if (_active.remove(item)) {
      _stored.add(item);
      notifyListeners();
    }
  }
}
=======
  final List<NotificationItem> _notifications = [];
  int _currentIndex = 0;
  Timer? _timer;

  int get unreadCount => _notifications.length;
  List<NotificationItem> get notifications =>
      List.unmodifiable(_notifications);

  final List<NotificationItem> _allNotifications = List.generate(
    50,
    (i) => NotificationItem(
      title: 'Alert ${i + 1}',
      description: 'Important update ${i + 1}',
      icon: Icons.notifications_active,
      time: DateTime.now().add(Duration(minutes: i * 3)),
    ),
  );

  void startAutoNotifications() {
    _timer ??= Timer.periodic(const Duration(minutes: 3), (timer) {
      if (_currentIndex < _allNotifications.length) {
        _notifications.insert(0, _allNotifications[_currentIndex]);
        _currentIndex++;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void remove(NotificationItem item) {
    _notifications.remove(item);
    notifyListeners();
  }

  void clearAll() {
    _notifications.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
>>>>>>> 02655a717726928bd2ed25a1901708364559916c
