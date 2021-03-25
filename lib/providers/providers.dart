import 'package:eti_crm_app/models/check_list_data_table_model.dart';
import 'package:eti_crm_app/models/user_model.dart';
import 'package:eti_crm_app/services/checklist_service.dart';
import 'package:eti_crm_app/services/cloud_firebase_service.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:eti_crm_app/view_models/checklist_data_table_view_model.dart';
import 'package:eti_crm_app/view_models/user_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checklistServiceProvider =
    Provider<ChecklistService>((ref) => ChecklistService(ref.read));

final userViewModelProvider = Provider<UserViewModel>((ref) {
  return UserViewModel(ref: ref);
});

final userModelStreamProvider = StreamProvider<UserModel>((ref) {
  return ref.watch(userViewModelProvider).userModelStream();
});

final cloudFirebaseServiceProvider =
    Provider<CloudFirebaseService>((ref) => CloudFirebaseService());

final $providerAutodisposeFamily = FutureProvider.autoDispose.family;

final futureDocumentProvider =
    $providerAutodisposeFamily<Map<String, dynamic>, String>(
        (ref, String path) async {
  return await ref.read(cloudFirebaseServiceProvider).getDocument(path: path);
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
