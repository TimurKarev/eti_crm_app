import 'package:eti_crm_app/forms/checklist_extract_arg.dart';
import 'package:eti_crm_app/forms/order_extract_arg.dart';
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
          Navigator.pushNamed(context, OrderExtractArg.routeName,
              arguments: OrderArguments(
                  action: OrderArguments.ACTION_VIEW_EXIST_ORDER,
                  orderNum: cell.order));
        }
        if (cell.action == DataTableCellModel.ACTION_CREATE_CHECKLIST) {
          Navigator.pushNamed(context, ChecklistExtractArg.routeName,
              arguments: ChecklistArguments(
                  action: ChecklistArguments.CHECKLIST_ACTION_CREATE,
                  type: cell.element,
                  orderNum: cell.order));
        }
        if (cell.action == DataTableCellModel.ACTION_VIEW_CHECKLIST) {
          Navigator.pushNamed(context, ChecklistExtractArg.routeName,
              arguments: ChecklistArguments(
                  action: ChecklistArguments.CHECKLIST_ACTION_VIEW,
                  type: cell.element,
                  orderNum: cell.order));
        }
      },
      child: Text(cell.label),
    );
  }
}
