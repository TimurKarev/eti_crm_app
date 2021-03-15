import 'package:eti_crm_app/forms/create_form_parent_page.dart';
import 'package:eti_crm_app/forms/edit_form_presenter.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditFormArguments {
  static const String ACTION_CREATE_ORDER = 'create_order';
  static const String ACTION_EDIT_EXIST_ORDER = 'edit_order';
  static const String ACTION_VIEW_EXIST_ORDER = 'view_order';

  final String action;
  final String orderNum;

  EditFormArguments({@required this.action, this.orderNum});
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
        return CreateFormParentPage(nextRoute: '/', editable: true,);
      }, loading: () {
        return CircularProgressIndicator();
      }, error: (e, _) {
        print(e.toString());
        return Text(e.toString());
      });
    }
    if (args.action == EditFormArguments.ACTION_EDIT_EXIST_ORDER) {
      return watch(editFormPresenterModelReadyProvider(
              FirestorePath.order(args.orderNum)))
          .when(data: (_) {
        return CreateFormParentPage(
            nextRoute: EditFormExtractArg.routeName,
            args: EditFormArguments(
                action: EditFormArguments.ACTION_VIEW_EXIST_ORDER,
                orderNum: args.orderNum),
            editable: true);
      }, loading: () {
        return CircularProgressIndicator();
      }, error: (e, _) {
        print(e.toString());
        return Text(e.toString());
      });
    }
    if (args.action == EditFormArguments.ACTION_VIEW_EXIST_ORDER) {
      return watch(editFormPresenterModelReadyProvider(
              FirestorePath.order(args.orderNum)))
          .when(data: (_) {
        return CreateFormParentPage(
            nextRoute: EditFormExtractArg.routeName,
            args: EditFormArguments(
                action: EditFormArguments.ACTION_EDIT_EXIST_ORDER,
                orderNum: args.orderNum),
            editable: false);
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
