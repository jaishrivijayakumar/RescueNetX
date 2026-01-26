import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String description;
  final IconData icon;
  final DateTime time;

  NotificationItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.time,
  });
}
