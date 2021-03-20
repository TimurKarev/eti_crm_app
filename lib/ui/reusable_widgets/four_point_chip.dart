import 'package:eti_crm_app/models/const/four_point_const.dart';
import 'package:flutter/material.dart';

class FourPointChip extends StatelessWidget {
  final String value;
  final String label;

  const FourPointChip({Key key, this.value, this.label}) : super(key: key);

  Widget get chip {
//    Icon icon;
    Color color = FourPointValues.valueMap[value]['color'];
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
