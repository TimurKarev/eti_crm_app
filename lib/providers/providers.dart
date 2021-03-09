import 'package:eti_crm_app/services/cloud_firebase_service.dart';
import 'package:eti_crm_app/view_models/checklist_data_table_view_model.dart';
import 'package:eti_crm_app/view_models/user_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userViewModelProvider = ChangeNotifierProvider<UserViewModel>((ref) {
  return UserViewModel(ref: ref);
});

final cloudFirebaseServiceProvider = Provider((ref) => CloudFirebaseService());

final checklistTableDataStream = StreamProvider<ChecklistDataTableModel>((ref) {
  final vm =  ChecklistDataTableViewModel(ref: ref);
  return vm.dataTableStreamListener();
});
