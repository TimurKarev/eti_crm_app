import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final Map<String, dynamic> point;
  final List<dynamic> variants;
  final int sectionIndex;
  final int pointIndex;
  final void Function(int, int, String) updateModelCallback;

  DropdownWidget(
      {@required this.point,
        @required this.variants,
        @required this.sectionIndex,
        @required this.pointIndex,
        @required this.updateModelCallback});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  var value;

  @override
  void initState() {
    super.initState();
    value = widget.point['value'];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          value = newValue;
          widget.updateModelCallback(
              widget.sectionIndex, widget.pointIndex, value);
        });
      },
      items: widget.variants.map<DropdownMenuItem<String>>((variant) {
        return DropdownMenuItem<String>(
          value: variant['value'],
          child: Text(variant['label']),
        );
      }).toList(),
    );
  }
}
