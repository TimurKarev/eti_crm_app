import 'package:flutter/cupertino.dart';

class ChecklistDataTableModel {
  final List<String> columns = [
    "Заказ",
    "Стройка",
    "Электрика",
    "Телемеханика",
    "Лаборатория"
  ];
  final List<String> columnIndexes = [
    "bm_checklist",
    "el_checklist",
    "tm_checklist",
    "lab_checklist"
  ];
  List<List<DataTableCellModel>> rows = [];

  ChecklistDataTableModel(Map<String, List<String>> data) {
    final ordersList = data.keys;
    ordersList.forEach((order) {
      List<DataTableCellModel> row = [
        DataTableCellModel(
            action: 'watch', label: order, order: order, element: order)
      ];
      columnIndexes.forEach((element) {
        if (data[order].contains(element)) {
          row.add(DataTableCellModel(
              action: 'watch',
              label: 'просмотр',
              order: order,
              element: element));
        } else {
          row.add(DataTableCellModel(
              action: 'create',
              label: 'создать',
              order: order,
              element: element));
        }
      });
      rows.add(row);
    });
  }
}

class DataTableCellModel {
  final String label;
  final String element;
  final String order;
  final String action;

  DataTableCellModel({this.action, this.label, this.element, this.order});

  String get callback {
    return label + element + order + action;
  }
}
