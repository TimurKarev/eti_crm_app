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
      _createChecklist(context, args.type, args.orderNum);
      return Text('Create checklist Success');
    } catch (e) {
      return Container(child: Text('${e.toString()}'));
    }
  }

  Future<void> _createChecklist(
      BuildContext context, String type, String orderNum) async {
    final data = await context
        .read(cloudFirebaseServiceProvider)
        .getDocument(path: FirestorePath.checklist_pattern(type));

    FormModel model = FormModel();
    model.model = data;
    print(model.model.toString());
  }
}
