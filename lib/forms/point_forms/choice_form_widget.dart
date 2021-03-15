import 'package:flutter/material.dart';

class ChoiceFormWidget extends StatefulWidget {
  final Map<String, dynamic> point;
  final List<dynamic> variants;
  final int sectionIndex;
  final int pointIndex;
  final bool editable;
  final void Function(int, int, String) updateModelCallback;

  ChoiceFormWidget({
    Key key,
    @required this.point,
    @required this.variants,
    @required this.sectionIndex,
    @required this.pointIndex,
    @required this.updateModelCallback,
    this.editable,
  }) : super(key: key);

  @override
  _ChoiceFormWidgetState createState() => _ChoiceFormWidgetState();
}

class _ChoiceFormWidgetState extends State<ChoiceFormWidget> {
  String value;

  @override
  void initState(){
    super.initState();
    value = widget.point['value'];
  }

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(widget.point['label']),
          widget.editable == true ?
          _createDropdownButton(widget.point, widget.variants) :
          Text(widget.point['value']),
        ],
      ),
    );
  }

  Widget _createDropdownButton(
      Map<String, dynamic> point, List<dynamic> variants) {
    //final variants = point['choices'];
    List<DropdownMenuItem> menuItems = [];
    variants.forEach((variant) {
      final menuItem = DropdownMenuItem<String>(
        child: Text(
          variant['label'].toString(),
        ),
        value: variant['value'],
      );
      menuItems.add(menuItem);
    });
    return DropdownButton(

      items: menuItems,
      value: value,
      onChanged: (newValue) {
        setState(() {
          value = newValue;
        });
        //print(value);
        widget.updateModelCallback(widget.sectionIndex, widget.pointIndex, value);
      },
    );
  }
}
