class EditFormState {
  static const ACTION_EDIT = 'action_edit';
  static const ACTION_CREATE = 'action_create';
  static const ACTION_AFTER_ALTERING = 'after_altering';

  bool isOrderExistError = false;
  String errorMessage = '';
  String action = '';
}