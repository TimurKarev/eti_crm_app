import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'form_model.dart';

class CreateChecklistArguments {
  final String type;
  final String orderNum;

  CreateChecklistArguments({this.type, this.orderNum});
}

class CreateChecklistExtractArg extends StatelessWidget {
  static final routeName = '/create_checklist';

  @override
  Widget build(BuildContext context) {
    final CreateChecklistArguments args =
        ModalRoute.of(context).settings.arguments;
    try {
      _createBMChecklist(context, args.type, args.orderNum);
      return Text('Create checklist Success');
    } catch (e) {
      return Container(child: Text('${e.toString()}'));
    }
  }

  Future<void> _createBMChecklist(
      BuildContext context, String type, String orderNum) async {
    final checklistData = await context
        .read(cloudFirebaseServiceProvider)
        .getDocument(path: FirestorePath.checklist_pattern(type));

    FormModel checklistModel = FormModel(model: checklistData);

    final orderConfigData = await context
        .read(cloudFirebaseServiceProvider)
        .getDocument(path: FirestorePath.order(orderNum));

    FormModel configModel = FormModel(model: orderConfigData);

    final dict = configModel.getIndexesDict();
    checklistModel.rebuildModelFromDict(
        dict: dict, order: orderNum, type: type);

    try {
      await context.read(cloudFirebaseServiceProvider).setDocument(
          path: FirestorePath.checklist(orderNum: orderNum, type: type),
          data: checklistModel.model);
    } catch (e) {
      print(e.toString());
    }
  }
}
