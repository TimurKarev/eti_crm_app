import 'package:eti_crm_app/forms/create_form_parent_page.dart';
import 'package:eti_crm_app/forms/edit_form_presenter.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:eti_crm_app/services/security/order_security.dart';
import 'package:eti_crm_app/ui/reusable_widgets/access_error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderArguments {
  static const String ACTION_CREATE_ORDER = 'create_order';
  static const String ACTION_EDIT_EXIST_ORDER = 'edit_order';
  static const String ACTION_VIEW_EXIST_ORDER = 'view_order';

  final String action;
  final String orderNum;

  OrderArguments({@required this.action, this.orderNum});
}

class OrderExtractArg extends ConsumerWidget {
  static final routeName = '/order';

  @override
  Widget build(BuildContext context, watch) {
    final OrderArguments args = ModalRoute.of(context).settings.arguments;

    if (args.action == OrderArguments.ACTION_CREATE_ORDER) {
      if (OrderSecurityService(context.read)
          .orderSecurityPermission(args.action)) {
        return watch(editFormPresenterModelReadyProvider(
                FirestorePath.order_create_form()))
            .when(data: (_) {
          return CreateFormParentPage(
            nextRoute: '/',
            editable: true,
          );
        }, loading: () {
          return CircularProgressIndicator();
        }, error: (e, _) {
          print(e.toString());
          return Text(e.toString());
        });
      } else {
        return AccessErrorPage();
      }
    }
    if (args.action == OrderArguments.ACTION_EDIT_EXIST_ORDER) {
      if (OrderSecurityService(context.read)
          .orderSecurityPermission(args.action)) {
        return watch(editFormPresenterModelReadyProvider(
                FirestorePath.order(args.orderNum)))
            .when(data: (_) {
          return CreateFormParentPage(
              nextRoute: OrderExtractArg.routeName,
              args: OrderArguments(
                  action: OrderArguments.ACTION_VIEW_EXIST_ORDER,
                  orderNum: args.orderNum),
              editable: true);
        }, loading: () {
          return CircularProgressIndicator();
        }, error: (e, _) {
          print(e.toString());
          return Text(e.toString());
        });
      } else {
        return AccessErrorPage();
      }
    }
    if (args.action == OrderArguments.ACTION_VIEW_EXIST_ORDER) {
      if (OrderSecurityService(context.read)
          .orderSecurityPermission(args.action)) {
        return watch(editFormPresenterModelReadyProvider(
            FirestorePath.order(args.orderNum)))
            .when(data: (_) {
          return CreateFormParentPage(
              nextRoute: OrderExtractArg.routeName,
              args: OrderArguments(
                  action: OrderArguments.ACTION_EDIT_EXIST_ORDER,
                  orderNum: args.orderNum),
              editable: false);
        }, loading: () {
          return CircularProgressIndicator();
        }, error: (e, _) {
          print(e.toString());
          return Text(e.toString());
        });
      } else {
        return AccessErrorPage();
      }
    }
    return Container();
  }
}
