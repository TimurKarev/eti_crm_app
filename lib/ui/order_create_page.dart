import 'package:eti_crm_app/view_models/order_create_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderCreatePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {
    final asyncData = watch(orderCreteDataProvider);
    return asyncData.when(
        data: (data) => data,
        loading: () => CircularProgressIndicator(),
        error: (e,_) => Text(e.toString()));
  }
}
