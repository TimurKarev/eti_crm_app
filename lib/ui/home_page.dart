import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/cloud_firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  //final arg = ArgumentData(collectionGroup: 'Checklists', field: 'order');
  @override
  Widget build(BuildContext context, watch) {
    final userViewModel = watch(userViewModelProvider);
    // AsyncValue<Map<String, List<String>>> val = watch(
    //     cloudFirebaseServiceChecklistTableProvider(arg
    //         ));
    return Scaffold(
      appBar: AppBar(
        title: Text("Домашняя страница"),
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
          // val.when(
          //     data: (data) {
          //       return Text(data.toString());
          //     },
          //     loading: () => CircularProgressIndicator(),
          //     error: (e, s) {
          //       print(e.toString());
          //       return Text('Error');
          //     }),
          TextButton(
            onPressed: () {
              _do(context.read(userViewModelProvider).userModel.uid);
            },
            child: Text('Do'),
          ),
        ],
      ),
    );
  }

  void _do(String uid) async {
  }
}
