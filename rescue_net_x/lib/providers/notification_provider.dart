import 'dart:async';
import 'package:flutter/material.dart';
import '../models/notification_item.dart';

class NotificationProvider extends ChangeNotifier {
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
