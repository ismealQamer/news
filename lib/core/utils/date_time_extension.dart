import 'package:flutter/material.dart';

extension DateTimeExtension on TimeOfDay {
  DateTime get dateTime => DateTime(0, 0, 0, hour, minute, 0);
}