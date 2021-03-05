import 'package:eti_crm_app/view_models/user_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userViewModelProvider = ChangeNotifierProvider<UserViewModel>((ref) {
  return UserViewModel(ref: ref);
});
