import 'package:eti_crm_app/forms/create_checklist_extract_arg.dart';
import 'package:eti_crm_app/forms/edit_form_extract_arg.dart';
import 'package:eti_crm_app/models/check_list_data_table_model.dart';
import 'package:flutter/material.dart';

class CellButtonDataTable extends StatelessWidget {
  final ChecklistDataTableModel model;

  const CellButtonDataTable({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [for (var col in model.columns) DataColumn(label: Text(col))],
      rows: [
        for (var row in model.rows)
          DataRow(cells: [
            for (var cell in row)
              DataCell(
                DataTableTextButton(
                  cell: cell,
                ),
              ),
          ]),
      ],
    );
  }
}

class DataTableTextButton extends StatelessWidget {
  final DataTableCellModel cell;

  const DataTableTextButton({Key key, this.cell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (cell.action == DataTableCellModel.ACTION_VIEW_ORDER) {
          Navigator.pushNamed(context, EditFormExtractArg.routeName,
              arguments: EditFormArguments(
                  action: EditFormArguments.ACTION_VIEW_EXIST_ORDER,
                  orderNum: cell.order));
        }
        if (cell.action == DataTableCellModel.ACTION_CREATE_CHECKLIST) {
          Navigator.pushNamed(context, CreateChecklistExtractArg.routeName,
              arguments: CreateChecklistArguments(
                  type: cell.element, orderNum: cell.order));
        }
        print(cell.callback);
      },
      child: Text(cell.label),
    );
  }
}
