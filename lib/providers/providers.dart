import 'package:eti_crm_app/models/check_list_data_table_model.dart';
import 'package:eti_crm_app/services/cloud_firebase_service.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:eti_crm_app/view_models/checklist_data_table_view_model.dart';
import 'package:eti_crm_app/view_models/user_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userViewModelProvider = ChangeNotifierProvider<UserViewModel>((ref) {
  return UserViewModel(ref: ref);
});

final cloudFirebaseServiceProvider = Provider((ref) => CloudFirebaseService());

final futureDocumentProvider =
    FutureProvider.family<Map<String, dynamic>, String>((ref, String path) {
  return ref.read(cloudFirebaseServiceProvider).getDocument(path: path);
});

final checklistTableDataStream = StreamProvider<ChecklistDataTableModel>((ref) {
  final vm = ChecklistDataTableViewModel(ref: ref);
  return vm.dataTableStreamListener();
});

final orderListStreamProvider = StreamProvider<List<String>>((ref) {
  return ref
      .watch(cloudFirebaseServiceProvider)
      .collectionStream(path: FirestorePath.Orders());
});
