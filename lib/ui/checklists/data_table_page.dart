import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/view_models/checklist_data_table_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataTablePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    AsyncValue<ChecklistDataTableModel> dataTableData = watch(
        checklistTableDataStream);
    return Scaffold(
      appBar: AppBar(
        title: Text('Список Заказов'),
      ),
      body: Column(children: [
        dataTableData.when(
            data: (data) => _getDataTable(data),
            loading: ()=> CircularProgressIndicator(),
            error: (e,s) => Text(e.toString() + s.toString())),
        false ? Text('Пустой чеклиск') : Container(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        tooltip: 'Создать новый заказ',
      ),
    );
  }

  _getDataTable(ChecklistDataTableModel model) {
    return SingleChildScrollView(
      child: DataTable(
        columns: [for (var col in model.columns) DataColumn(label: Text(col))],
        rows: [ for (var row in model.rows)
          DataRow(cells: [for (var cell in row)  DataCell(Text(cell.toString())),
          ]),
        ],
      ),
    );
  }
}
