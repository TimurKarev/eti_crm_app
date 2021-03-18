import 'package:eti_crm_app/presenters/checklist_presenter.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:eti_crm_app/ui/checklists/edit_checklist_page.dart';
import 'package:eti_crm_app/ui/checklists/view_checklist_page.dart';
import 'package:eti_crm_app/ui/security/checklist_security.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

import 'form_model.dart';

final createChecklistFutureProvider =
    FutureProvider.family<void, ChecklistArguments>(
        (ref, ChecklistArguments args) {
  return ref
      .read(checklistServiceProvider)
      .createChecklist(args.type, args.orderNum);
});

class ChecklistArguments {
  static const CHECKLIST_ACTION_CREATE = 'checklist_create';
  static const CHECKLIST_ACTION_EDIT = 'checklist_edit';
  static const CHECKLIST_ACTION_VIEW = 'checklist_view';

  final String type;
  final String orderNum;
  final String action;

  ChecklistArguments(
      {this.action: ChecklistArguments.CHECKLIST_ACTION_VIEW,
      @required this.type,
      @required this.orderNum});
}

class ChecklistExtractArg extends ConsumerWidget {
  static final routeName = '/checklist';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final ChecklistArguments args = ModalRoute.of(context).settings.arguments;

    if (args.action == ChecklistArguments.CHECKLIST_ACTION_CREATE) {
      return ChecklistSecurity.checklistEdit(
          child: _checklistCreateWidget(watch, args));
    }
    if (args.action == ChecklistArguments.CHECKLIST_ACTION_VIEW) {
      return ChecklistSecurity.checklistView(
        child: _createChecklistWhenReturnViewWidget(watch, args),
      );
    }
    if (args.action == ChecklistArguments.CHECKLIST_ACTION_EDIT) {
      return watch(futureDocumentProvider(FirestorePath.checklist(
              orderNum: args.orderNum, type: args.type)))
          .when(
              data: (data) {
                return ChecklistSecurity.checklistEdit(
                  child: EditChecklistPage(
                      presenter:
                          ChecklistPresenter(model: FormModel(model: data))),
                );
              },
              loading: () => CircularProgressIndicator(),
              error: (e, _) {
                return Text(e.toString());
              });
    }
    return CircularProgressIndicator();
  }

  Widget _checklistCreateWidget(ScopedReader watch, ChecklistArguments args) {
    return watch(createChecklistFutureProvider(args)).when(
        data: (_) {
          return _createChecklistWhenReturnViewWidget(watch, args);
        },
        loading: () => CircularProgressIndicator(),
        error: (e, _) {
          return Text(e.toString());
        });
  }

  Widget _createChecklistWhenReturnViewWidget(ScopedReader watch, ChecklistArguments args) {
    return watch(futureDocumentProvider(
            FirestorePath.checklist(orderNum: args.orderNum, type: args.type)))
        .when(
            data: (data) {
              return ViewChecklistPage(
                  presenter: ChecklistPresenter(model: FormModel(model: data)));
            },
            loading: () => CircularProgressIndicator(),
            error: (e, _) {
              return Text(e.toString());
            });
  }

  Future<void> _createChecklist(
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
