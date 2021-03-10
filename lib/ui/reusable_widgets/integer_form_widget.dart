import 'package:eti_crm_app/services/index_value_implementator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormWidget extends StatefulWidget with ValueIndexImplementer {

  final Map<String, dynamic> point;
  final TextEditingController _controller = TextEditingController();

  FormWidget({Key key, this.point}) : super(key: key){
    _controller.text = point['value'];
  }

  @override
  _FormWidgetState createState() => _FormWidgetState();

  @override
  String getIndex() {
    return point['index'];
  }

  @override
  String getValue() {
    return _controller.text;
  }
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(widget.point['label']),
        SizedBox(
          width: 60.0,
          child: TextFormField(
            controller: widget._controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            //initialValue: widget.point['value'],
          ),
        ),
      ]),
    );
  }
}
