import 'package:eti_crm_app/models/cloudfirestore_patterns/order_config_pattern.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final userViewModel = watch(userViewModelProvider);
    // AsyncValue<Map<String, List<String>>> val = watch(
    //     cloudFirebaseServiceChecklistTableProvider(arg
    //         ));
    //final AsyncValue<List<String>> asyncOrderList = watch(orderListStreamProvider);
   // asyncOrderList.whenData((value) => print(value.toString()));
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
    );
  }

  void _setDocument(BuildContext context) async {
    context.read(cloudFirebaseServiceProvider).setData(
        path: FirestorePath.order_create_form(),
        data: OrderConfigPattern.orderConfig);
  }
}
