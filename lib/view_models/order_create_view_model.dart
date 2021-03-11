import 'package:eti_crm_app/models/order_create_model.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:eti_crm_app/ui/reusable_widgets/integer_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderCreateViewModelProvider =
    Provider((ref) => OrderCreateViewModel(read: ref.read));

final orderCreteDataProvider = FutureProvider<bool>((ref) async {
  final vm = ref.watch(orderCreateViewModelProvider);
  return vm.data;
});

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

  Future<void> _saveDocument() async {
    await read(cloudFirebaseServiceProvider).setDocument(
        path: FirestorePath.order(_model.orderName), data: _model.data);
  }

  Widget get page {
    return Scaffold(
      appBar: AppBar(
        title: Text(_model.pageTitle),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: _saveDocument,
      ),
      body: _buildBody(),
    );
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
          result.add(_createChoiceFiled(point, variants));
        }
      }
    }
    return Container(child: Column(children: result));
  }

  void _update(int s, int c, String value) {
    _model.setPointValueByIndex(s, c, value);
    print(_model.getSectionPointByIndex(s, c));
  }

  Widget _createChoiceFiled(
      Map<String, dynamic> point, List<dynamic> variants) {
    return Row(
      children: [
        Text(point['label']),
        _createDropdownButton(point, variants),
      ],
    );
  }

  Widget _createDropdownButton(
      Map<String, dynamic> point, List<dynamic> variants) {
    //final variants = point['choices'];
    List<DropdownMenuItem> menuItems = [];
    variants.forEach((variant) {
      final menuItem = DropdownMenuItem<String>(
        child: Text(
          variant['label'].toString(),
        ),
        value: variant['value'],
      );
      menuItems.add(menuItem);
    });
    return DropdownButton(
      items: menuItems,
      value: 'bktp',
      onChanged: (newValue) {
        print(newValue.toString());
      },
    );
  }
}
