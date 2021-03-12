import 'package:eti_crm_app/forms/edit_form_body.dart';
import 'package:eti_crm_app/forms/edit_form_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditFormParentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleText = context.read(editFormPresenterProvider).titleText;
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/'),
            icon: Icon(Icons.home),
            label: Text(''),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          await context.read(editFormPresenterProvider).saveDocument();
            //Navigator.pushNamed(context, '/order-detail');
        }, //_saveDocument,
      ),
      body: EditFormBody(),
    );
  }
}
