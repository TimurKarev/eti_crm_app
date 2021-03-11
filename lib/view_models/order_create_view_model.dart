import 'package:eti_crm_app/models/order_create_model.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:eti_crm_app/ui/reusable_widgets/forms/choice_form_widget.dart';
import 'package:eti_crm_app/ui/reusable_widgets/forms/integer_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderCreateViewModelProvider =
    Provider((ref) => OrderCreateViewModel(read: ref.read));

final orderCreteDataProvider = FutureProvider<bool>((ref) async {
  final vm = ref.watch(orderCreateViewModelProvider);
  return vm.data;
});

//TODO: refactor for better architecture make it State notifier and make normal widget class
class OrderCreateViewModel {
  final Reader read;
  OrderCreateModel _model;

  OrderCreateViewModel({this.read});

  //TODO: change return value of getter
  Future<bool> get data async {
    final _data = await read(cloudFirebaseServiceProvider)
        .getDocument(path: FirestorePath.order_create_form());
    _model = OrderCreateModel(_data);
    return true;
  }

  Future<bool> _isOrderExist() async {
    var orders = read(orderListStreamProvider).data.value;

    if (orders.contains(_model.orderName)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveDocument() async {
    bool isOrderExist = await _isOrderExist();
    if (!isOrderExist) {
      await read(cloudFirebaseServiceProvider).setDocument(
          path: FirestorePath.order(_model.orderName), data: _model.data);
    } else {}
  }

  Widget get page {
    return _buildBody();
  }

  Widget _buildBody() {
    List<Widget> result = [];
    for (var sIndex = 0; sIndex < _model.sectionsNumber; sIndex++) {
      result.add(
        Text(_model.getSectionLabelByIndex(sIndex)),
      );
      for (var pIndex = 0;
          pIndex < _model.getPointsNumberInSection(sIndex);
          pIndex++) {
        final point = _model.getSectionPointByIndex(sIndex, pIndex);
        if (point['type'] == 'integer') {
          result.add(IntegerFormWidget(
              point: point,
              sectionIndex: sIndex,
              pointIndex: pIndex,
              updateModelCallback: _update));
        }
        if (point['type'] == 'choice') {
          final variants =
              _model.getChoiceVariantsByStringIndex(point['variants_index']);
          result.add(ChoiceFormWidget(
            point: point,
            variants: variants,
            sectionIndex: sIndex,
            pointIndex: pIndex,
            updateModelCallback: _update,
          ));
        }
      }
    }
    return Container(child: Column(children: result));
  }

  void _update(int s, int c, String value) {
    _model.setPointValueByIndex(s, c, value);
    //print(_model.getSectionPointByIndex(s, c));
  }
}
