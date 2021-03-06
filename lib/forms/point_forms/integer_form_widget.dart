import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntegerFormWidget extends StatelessWidget {
  final Map<String, dynamic> point;
  final int sectionIndex;
  final int pointIndex;
  final void Function(int, int, String) updateModelCallback;

  final TextEditingController _controller = TextEditingController();

  IntegerFormWidget({
    Key key,
    this.point,
    this.sectionIndex,
    this.pointIndex,
    this.updateModelCallback,
  }) : super(key: key) {
    _controller.text = point['value'];
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      child: TextFormField(
        onChanged: (value) =>
            updateModelCallback(sectionIndex, pointIndex, value),
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        //initialValue: widget.point['value'],
      ),
    );
  }
}
