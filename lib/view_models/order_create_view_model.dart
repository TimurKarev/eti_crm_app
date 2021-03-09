import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderCreateViewModelProvider =
    Provider((ref) => OrderCreateViewModel(read: ref.read));

final orderCreteDataProvider = FutureProvider<OrderCreateModel>((ref) async {
  final vm = ref.watch(orderCreateViewModelProvider);
  return vm.data;
});

class OrderCreateViewModel {
  final Reader read;

  OrderCreateViewModel({this.read});

  Map<String, dynamic> _model = {};

  Future<OrderCreateModel> get data async {
    _model = await read(cloudFirebaseServiceProvider)
        .getDocument(path: FirestorePath.order_create_form());
    return OrderCreateModel(_model);
  }
}

class OrderCreateModel {
  final Map<String, dynamic> _model;

  String get pageTitle => _model['title'];

  List<dynamic> get pagePoints => _model['points'];

  List<dynamic> getChoiceVariant(String pointIndex) {
     return _model['choice_variants'][pointIndex];

  }

  OrderCreateModel(this._model);
}
