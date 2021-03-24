import 'package:eti_crm_app/models/cloudfirestore_patterns/order_config_pattern.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = context.read(userViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Административная страница"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.read(userViewModelProvider).signOut();
            },
            child: Text('Выход'),
          )
        ],
      ),
      body: Column(
        children: [
          userViewModel.userModel.roles.isEmpty
              ? Container()
              : Text('${userViewModel.userModel.roles.toString()}'),
          TextButton(
            onPressed: () {
              _setDocument(context);
            },
            child: Text('setDocument'),
          ),
        ],
      ),
     // body: SingleChildScrollView(child: Container(child: _buildPanel())),
    );
  }

  void _setDocument(BuildContext context) async {
    try {

      // await context.read(cloudFirebaseServiceProvider).setData(
      //     path: FirestorePath.order_create_form(),
      //     data: OrderConfigPattern.orderConfig);
      //
      // // await context.read(cloudFirebaseServiceProvider).setData(
      // //     path: FirestorePath.checklist_pattern('bm_checklist'),
      // //     data: OrderConfigPattern.bmChecklistConfig);
      //
      // await context.read(cloudFirebaseServiceProvider).setData(
      //     path: FirestorePath.checklist_pattern('el_checklist'),
      //     data: OrderConfigPattern.elChecklistConfig);

      await context.read(cloudFirebaseServiceProvider).setData(
          path: FirestorePath.checklist_pattern('doc_checklist'),
          data: OrderConfigPattern.docChecklistConfig);

    } catch (e) {
      print(e.toString());
    }
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {});
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text('item.headerValue'),
            );
          },
          isExpanded: true,
          body: ListTile(
            title: Text('item.headerValue'),
            trailing: _getButton(),
          ),
        ),
      ],
    );
  }

  Widget _getButton() {
    /// Flutter code sample for DropdownButton

    return DropdownButton<String>(
      value: 'One',
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {},
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
