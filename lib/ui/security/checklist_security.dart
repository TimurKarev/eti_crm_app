import 'package:eti_crm_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RolesConst {
  static const String SUPERUSER = 'superuser';

  static const String CHECKLIST_VIEWER = 'checklist_viewer';
  static const String CHECKLIST_EDITOR = 'checklist_editor';
  static const String CHECKLIST_CREATOR = 'checklist_creator';

  static const String ORDER_VIEWER = 'order_viewer';
  static const String ORDER_EDITOR = 'order_editor';
  static const String ORDER_CREATOR = 'order_creator';
}

class ChecklistSecurity extends StatelessWidget {
  final String errorMessage;
  final Widget child;
  final Set<String> _roles = {RolesConst.SUPERUSER};

  ChecklistSecurity(
      {Key key,
      @required this.errorMessage,
      @required Set<String> roles,
      @required this.child})
      : super(key: key) {
    _roles.addAll(roles);
  }

  @override
  Widget build(BuildContext context) {
    final userRoles = context.read(userViewModelProvider).roles;
    bool isHavePermission = false;

    for (var element in userRoles) {
      if (_roles.contains(element)) {
        isHavePermission = true;
        break;
      }
    }

    return isHavePermission ? child : Text(errorMessage);
  }

  factory ChecklistSecurity.checklistView({@required child}) {
    final message = 'недостаточно прав';
    return ChecklistSecurity(
      errorMessage: message,
      roles: {RolesConst.CHECKLIST_VIEWER},
      child: child,
    );
  }
  factory ChecklistSecurity.checklistEdit({@required child}) {
    final message = 'недостаточно прав';
    return ChecklistSecurity(
      errorMessage: message,
      roles: {RolesConst.CHECKLIST_EDITOR},
      child: child,
    );
  }
}
