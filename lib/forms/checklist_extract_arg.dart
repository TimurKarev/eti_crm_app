import 'package:eti_crm_app/presenters/checklist_presenter.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:eti_crm_app/services/security/checklist_security.dart';
import 'package:eti_crm_app/ui/checklists/data_table_page.dart';
import 'package:eti_crm_app/ui/checklists/edit_checklist_page.dart';
import 'package:eti_crm_app/ui/checklists/view_checklist_page.dart';
import 'package:eti_crm_app/ui/reusable_widgets/access_error_page.dart';
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

    // try {
      if (args.action == ChecklistArguments.CHECKLIST_ACTION_CREATE) {
        if (ChecklistSecurityService(context.read).checkSecurityPermission(args.action)){
          return _createChecklistWhenGetViewPage(watch, args);
        } else {
          return AccessErrorPage();
        }
      }
      if (args.action == ChecklistArguments.CHECKLIST_ACTION_VIEW) {
        if (ChecklistSecurityService(context.read).checkSecurityPermission(args.action)){
          return _getViewChecklistPage(watch, args);
        } else {
          return AccessErrorPage();
        }
      }
      if (args.action == ChecklistArguments.CHECKLIST_ACTION_EDIT) {
        if (ChecklistSecurityService(context.read).checkSecurityPermission(args.action)){
          return _getEditChecklistPage(watch, args);
        } else {
          return AccessErrorPage();
        }
      }
    // } catch (e) {
    //   print(e.toString());
    //   //Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
    // }
    return DataTablePage();
  }

  Widget _createChecklistWhenGetViewPage(ScopedReader watch, ChecklistArguments args) {
    return watch(createChecklistFutureProvider(args)).when(
        data: (_) {
          return _getViewChecklistPage(watch, args);
        },
        loading: () => CircularProgressIndicator(),
        error: (e, _) {
          return Text(e.toString());
        });
  }

  Widget _getViewChecklistPage(ScopedReader watch, ChecklistArguments args) {
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

  Widget _getEditChecklistPage(ScopedReader watch, ChecklistArguments args) {
    return watch(futureDocumentProvider(FirestorePath.checklist(
        orderNum: args.orderNum, type: args.type)))
        .when(
        data: (data) {
          return EditChecklistPage(
                presenter:
                ChecklistPresenter(model: FormModel(model: data)));
        },
        loading: () => CircularProgressIndicator(),
        error: (e, _) {
          return Text(e.toString());
        });
  }


}
