import 'package:eti_crm_app/forms/checklist_extract_arg.dart';
import 'package:eti_crm_app/forms/order_extract_arg.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/security/roles_const.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderSecurityService {
  final Reader read;
  Set<String> _docRoles = {RolesConst.SUPERUSER};

  OrderSecurityService(this.read);
  bool orderSecurityPermission(String action) {
    final userRoles = read(userViewModelProvider).roles;

    if (action == OrderArguments.ACTION_CREATE_ORDER) {
      _docRoles.addAll({RolesConst.ORDER_CREATOR});
    }

    if (action == OrderArguments.ACTION_VIEW_EXIST_ORDER) {
      _docRoles.addAll({RolesConst.ORDER_VIEWER});
    }

    if (action == OrderArguments.ACTION_EDIT_EXIST_ORDER) {
      _docRoles.addAll({RolesConst.ORDER_EDITOR});
    }

    return _isHavePermissions(userRoles, _docRoles);
  }

  static bool _isHavePermissions(Set<String> userRoles, Set<String> docRoles) {
    for (var element in userRoles) {
      if (docRoles.contains(element)) {
        return true;
      }
    }
    return false;
  }
}
