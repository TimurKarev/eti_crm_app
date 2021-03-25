import 'package:eti_crm_app/forms/form_model.dart';
import 'package:eti_crm_app/presenters/order_presenter.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:eti_crm_app/services/security/order_security.dart';
import 'package:eti_crm_app/ui/checklists/data_table_page.dart';
import 'package:eti_crm_app/ui/order/create_order_page.dart';
import 'package:eti_crm_app/ui/order/edit_order_page.dart';
import 'package:eti_crm_app/ui/order/view_order_page.dart';
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

    // try {
      if (args.action == OrderArguments.ACTION_CREATE_ORDER) {
        if (OrderSecurityService(context.read)
            .orderSecurityPermission(args.action)) {
          return _getCreateOrderPage(watch, args);
        } else {
          return AccessErrorPage();
        }
      }
      if (args.action == OrderArguments.ACTION_EDIT_EXIST_ORDER) {
        if (OrderSecurityService(context.read)
            .orderSecurityPermission(args.action)) {
          return _getEditOrderPage(watch, args);
        } else {
          return AccessErrorPage();
        }
      }
      if (args.action == OrderArguments.ACTION_VIEW_EXIST_ORDER) {
        if (OrderSecurityService(context.read)
            .orderSecurityPermission(args.action)) {
          return _getViewOrderPage(watch, args);
        } else {
          return AccessErrorPage();
        }
      }
    // } on NoSuchMethodError catch (e) {
    //   print(e.toString());
    // }
    return CircularProgressIndicator();
  }

  Widget _getViewOrderPage(ScopedReader watch, OrderArguments args) {
    return watch(futureDocumentProvider(FirestorePath.order(args.orderNum)))
        .when(
            data: (data) {
              return ViewOrderPage(
                presenter: OrderPresenter(model: FormModel(model: data)),
              );
            },
            loading: () => CircularProgressIndicator(),
            error: (e, _) {
              return Text(e.toString());
            });
  }

  Widget _getEditOrderPage(watch, OrderArguments args) {
    return watch(futureDocumentProvider(FirestorePath.order(args.orderNum)))
        .when(
            data: (data) {
              return EditOrderPage(
                presenter: OrderPresenter(model: FormModel(model: data)),
              );
            },
            loading: () => CircularProgressIndicator(),
            error: (e, _) {
              return Text(e.toString());
            });
  }

  Widget _getCreateOrderPage(watch, OrderArguments args) {

    return watch(futureDocumentProvider(FirestorePath.order_create_form()))
        .when(
            data: (data) {
              return CreateOrderPage(
                presenter: OrderPresenter(model: new FormModel(model: data)),
              );
            },
            loading: () => CircularProgressIndicator(),
            error: (e, _) {
              return Text(e.toString());
            });
  }
}
