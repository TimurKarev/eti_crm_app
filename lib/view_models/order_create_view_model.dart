import 'package:eti_crm_app/models/order_create_model.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:eti_crm_app/ui/reusable_widgets/integer_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Widget get page {
    return Scaffold(
      appBar: AppBar(
        title: Text(_model.pageTitle),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {},
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
          final w = FormWidget(point: point);
          result.add(w);
          print(w.getValue());
        }
        if (point['type'] == 'choice') {
          result.add(_createChoiceFiled(point));
        }
      }
    }
    return Container(child: Column(children: result));
  }

  Widget _createIntegerFiled(Map<String, dynamic> point) {
    return Container(
      child: Row(children: [
        Text(point['label']),
        SizedBox(
          width: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            initialValue: point['value'],
          ),
        ),
      ]),
    );
  }

  Widget _createChoiceFiled(Map<String, dynamic> point) {
    return Row(
      children: [
        Text(point['label']),
        _createDropdownButton(point),
      ],
    );
  }

  Widget _createDropdownButton(Map<String, dynamic> point) {
    final variants = point['choices'];
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
