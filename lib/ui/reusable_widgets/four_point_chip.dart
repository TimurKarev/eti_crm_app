import 'package:flutter/material.dart';

class FourPointChip extends StatelessWidget {
  static const String UNCHECKED = 'unchecked';
  static const String COMMENT = 'comment';
  static const String APPROVED = 'approved';
  static const String NOT_USED = 'not_used';

  final String value;
  final String label;

  const FourPointChip({Key key, this.value, this.label}) : super(key: key);

  Widget get chip {
//    Icon icon;
    Color color;
    if (value == UNCHECKED) {
      color = Colors.grey;
     // icon = Icon(Icons.add_alarm, color: color,);
    }
    if (value == COMMENT) {
      color = Colors.red;
     // icon = Icon(Icons.error, color: color);
    }
    if (value == APPROVED) {
      color = Colors.green;
     // icon = Icon(Icons.check_circle, color: color);
    }
    if (value == NOT_USED) {
      color = Colors.yellow.shade200;
     // icon = Icon(Icons.close, color: color,);
    }
    return Chip(
      backgroundColor: color,
      label: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return chip;
  }
}
