import 'package:flutter/material.dart';

class FourPointValues {
  static const String UNCHECKED = 'unchecked';
  static const String COMMENT = 'comment';
  static const String APPROVED = 'approved';
  static const String NOT_USED = 'not_used';

  static final Map<String, dynamic> valueMap = {
    UNCHECKED: {
      'color': Colors.grey,
      'icon': Icons.add_alarm,
    },
    COMMENT: {
      'color': Colors.red,
      'icon': Icons.error,
    },
    APPROVED: {
      'color': Colors.green,
      'icon': Icons.check_circle,
    },
    NOT_USED: {
      'color': Colors.yellow.shade200,
      'icon': Icons.close,
    }

  };
}