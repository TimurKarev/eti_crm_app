import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final userViewModel = watch(userViewModelProvider);
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
          userViewModel.userModel.roles.isEmpty ? Container() : Text('${userViewModel.userModel.roles[0]}'),
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
    // final DocumentReference reference = FirebaseFirestore.instance.doc('/users/$uid');
    //
    // try {
    //   final snapshot = await reference.get();
    //   print(snapshot.data().toString());
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
