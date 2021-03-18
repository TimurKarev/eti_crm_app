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
      // body: Column(
      //   children: [
      //     userViewModel.userModel.roles.isEmpty
      //         ? Container()
      //         : Text('${userViewModel.userModel.roles.toString()}'),
      //     TextButton(
      //       onPressed: () {
      //         _setDocument(context);
      //       },
      //       child: Text('setDocument'),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(child: Container(child: _buildPanel())),
    );
  }

  void _setDocument(BuildContext context) async {
    // context.read(cloudFirebaseServiceProvider).setData(
    //     path: FirestorePath.order_create_form(),
    //     data: OrderConfigPattern.orderConfig);
    context.read(cloudFirebaseServiceProvider).setData(
        path: FirestorePath.checklist_pattern('bm_checklist'),
        data: OrderConfigPattern.bmChecklistConfig);
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
          body: ListTile(
              title: Text('item.expandedValue'),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {}),
          isExpanded: false,
        ),
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text('item.headerValue'),
            );
          },
          body: Container(
            child: Column(children: [
              ListTile(
                title: Text('item.expandedValue'),
                subtitle:
                    const Text('To delete this panel, tap the trash can icon'),
                trailing: const Icon(Icons.delete),
              ),
              ListTile(
                title: Text('item.expandedValue'),
                subtitle:
                const Text('To delete this panel, tap the trash can icon'),
                trailing: const Icon(Icons.delete),
              ),
            ]),
          ),
          isExpanded: true,
        ),
      ],
    );
  }
}
