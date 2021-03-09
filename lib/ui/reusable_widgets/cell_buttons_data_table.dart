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
      onPressed: () => print(cell.callback),
      child: Text(cell.label),
    );
  }
}
