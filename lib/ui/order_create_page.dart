import 'package:eti_crm_app/models/order_create_model.dart';
import 'package:eti_crm_app/view_models/order_create_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderCreatePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final asyncData = watch(orderCreteDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('_model.pageTitle'),
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
          await context.read(orderCreateViewModelProvider).saveDocument();
          Navigator.pushNamed(context, '/order-detail');
        }, //_saveDocument,
      ),
      body: asyncData.when(
          data: (_) => context.read(orderCreateViewModelProvider).page,
          loading: () => CircularProgressIndicator(),
          // TODO: create widget for loading indicator
          error: (e, _) => Text(e.toString())),
    );
  }
}
