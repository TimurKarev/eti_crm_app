import 'package:eti_crm_app/models/check_list_data_table_model.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChecklistDataTableViewModel {
  final ProviderReference ref;
  final arguments = ["Checklists", "order"];

  ChecklistDataTableViewModel({@required this.ref});

  Stream<ChecklistDataTableModel> dataTableStreamListener() {
    Stream<Map<String, List<String>>> groupMap = ref
        .read(cloudFirebaseServiceProvider)
        .collectionGroupStream(
            collectionGroup: arguments[0], field: arguments[1]);
    return groupMap.map((data) {
      AsyncValue<List<String>> orderList = ref.watch(orderListStreamProvider);
      orderList.whenData((orders) => {orders.forEach((order) {
        if(!data.containsKey(order)){
          data[order] = [];
        }
      })});
      return ChecklistDataTableModel(data);
    });
  }
}
