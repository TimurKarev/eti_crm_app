import 'package:eti_crm_app/forms/form_model.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChecklistService {
  final Reader read;

  ChecklistService(this.read);

  Future<void> createChecklist(
      String type, String orderNum) async {
    try {
      final checklistData = await read(cloudFirebaseServiceProvider)
          .getDocument(path: FirestorePath.checklist_pattern(type));

      FormModel checklistModel = FormModel(model: checklistData);

      final orderConfigData = await read(cloudFirebaseServiceProvider)
          .getDocument(path: FirestorePath.order(orderNum));

      FormModel configModel = FormModel(model: orderConfigData);

      final dict = configModel.getIndexesDict();
      checklistModel.rebuildModelFromDict(
          dict: dict, order: orderNum, type: type);

      await read(cloudFirebaseServiceProvider).setDocument(
          path: FirestorePath.checklist(orderNum: orderNum, type: type),
          data: checklistModel.model);
    } catch (e) {
      print(e.toString());
    }
  }
}
