import 'package:eti_crm_app/view_models/order_create_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderCreatePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final asyncData = watch(orderCreteDataProvider);
    return asyncData.when(
        data: (data) => _buildPage(data),
        loading: () => CircularProgressIndicator(),
        // TODO: create widget for loading indicator
        error: (e, _) => Text(e.toString()));
  }

  Widget _buildPage(OrderCreateModel data) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.pageTitle),
        ),
        body: _buildBody(data));
  }

  _buildBody(OrderCreateModel data) {
    final points = data.pagePoints;
    List<Widget> body = [];
    for (var index = 0; index < data.pagePoints.length; index++) {
      final point = data.pagePoints[index];
      if (point['type'] == 'choice') {
//        print(data.getChoiceVariant(point['variants_index']));
        body.add(
          Row(
            children: [
              Text(point['label']),
              _createDropdownButton(data, index),
            ],
          ),
        );
        // return DropdownButton(
        //     items: data.getChoiceVariant(point['variants_index']));
      }
      if (point['type'] == 'integer') {
        body.add(
          Row(children: [
            Text(point['label']),
            SizedBox(
              width: 20.0,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                initialValue: point['value'],
                //decoration: new InputDecoration(labelText: "Enter your number"),
                //   keyboardType: TextInputType.number,
              ),
            ),
            // TextFormField(
            //   initialValue: point['value'],
            //   keyboardType: TextInputType.number,
            // )
          ]),
        );
      }
    }
    return Container(
      child: Column(
        children: body,
      ),
    );
  }

  Widget _createDropdownButton(OrderCreateModel data, int index) {
    var point = data.pagePoints[index];
    print(point);
    final variants = data.getChoiceVariant(point['variants_index']);
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
