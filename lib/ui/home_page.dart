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
          FlatButton(
            onPressed: () {
              context.read(userViewModelProvider).signOut();
            },
            child: Text('Выход'),
          )
        ],
      ),
      body: Text('${userViewModel.userModel.email}'),
    );
  }
}
