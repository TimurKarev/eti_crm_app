import 'package:eti_crm_app/forms/create_form_body.dart';
import 'package:eti_crm_app/forms/edit_form_extract_arg.dart';
import 'package:eti_crm_app/forms/edit_form_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateFormParentPage extends StatelessWidget {
  final String nextRoute;
  final EditFormArguments args;
  final bool editable;
  CreateFormParentPage({@required this.nextRoute, this.args, this.editable: false});
  @override
  Widget build(BuildContext context) {
    final titleText = context.read(editFormPresenterProvider).titleText;
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r)=>false),
            icon: Icon(Icons.home),
            label: Text(''),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          try {
            await context.read(editFormPresenterProvider).saveDocument();
            Navigator.pushNamedAndRemoveUntil(context, nextRoute, (r) => false, arguments: args);
          } catch (e) {
            print(e.toString());
          }
          //context.read(editFormPresenterProvider).dispose();

        }, //_saveDocument,
      ),
      body: CreateFormBody(editable: editable),
    );
  }
}
