import 'package:eti_crm_app/models/check_list_data_table_model.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/ui/reusable_widgets/cell_buttons_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../my_page.dart';
import '../order_create_page.dart';

class DataTablePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    AsyncValue<ChecklistDataTableModel> dataTableData =
        watch(checklistTableDataStream);

    return Scaffold(
      appBar: AppBar(
        title: Text('Список Заказов'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MyPage();
                  }),
                );
              },
              icon: Icon(Icons.settings),
              label: Text('Admin')),
        ],
      ),
      body: Column(children: [
        dataTableData.when(
            data: (data) => _getDataTable(data),
            loading: () => CircularProgressIndicator(),
            error: (e, s) => Text(e.toString() + s.toString())),
        false ? Text('Пустой чеклиск') : Container(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return OrderCreatePage();
            }),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Создать новый заказ',
      ),
    );
  }

  _getDataTable(ChecklistDataTableModel model) {
    return SingleChildScrollView(
      child: CellButtonDataTable(model: model),
    );
  }
}
