import 'package:eti_crm_app/forms/edit_form_parent_page.dart';
import 'package:eti_crm_app/forms/edit_form_presenter.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditFormArguments {
  static const String ACTION_CREATE_ORDER = 'create_order';
  final String action;

  EditFormArguments({this.action});
}

class EditFormExtractArg extends ConsumerWidget {
  static final routeName = '/edit';

  @override
  Widget build(BuildContext context, watch) {
    final EditFormArguments args = ModalRoute.of(context).settings.arguments;

    if (args.action == EditFormArguments.ACTION_CREATE_ORDER) {
      return watch(editFormPresenterModelReadyProvider(
              FirestorePath.order_create_form()))
          .when(data: (_) {
        return EditFormParentPage();
      }, loading: () {
        return CircularProgressIndicator();
      }, error: (e, _) {
        print(e.toString());
        return Text(e.toString());
      });
    }
    return Container();
  }
}
