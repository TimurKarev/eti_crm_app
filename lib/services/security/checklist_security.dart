import 'package:eti_crm_app/forms/checklist_extract_arg.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/security/roles_const.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChecklistSecurityService {
  final Reader read;
  Set<String> _docRoles = {RolesConst.SUPERUSER};

  ChecklistSecurityService(this.read);
  bool checkSecurityPermission(String action) {
    final userRoles = read(userViewModelProvider).roles;

    if (action == ChecklistArguments.CHECKLIST_ACTION_CREATE) {
      _docRoles.addAll({RolesConst.CHECKLIST_CREATOR});
    }

    if (action == ChecklistArguments.CHECKLIST_ACTION_VIEW) {
      _docRoles.addAll({RolesConst.CHECKLIST_VIEWER});
    }

    if (action == ChecklistArguments.CHECKLIST_ACTION_EDIT) {
      _docRoles.addAll({RolesConst.CHECKLIST_EDITOR});
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
