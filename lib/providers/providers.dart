import 'package:eti_crm_app/models/user_model.dart';
import 'package:eti_crm_app/services/auth.dart';
import 'package:eti_crm_app/view_models/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider<CloudFirebaseAuth>((ref) {
  return CloudFirebaseAuth();
});

final authStateChangeProvider = StreamProvider<User>((ref) {
  final auth = ref.watch(authProvider);
  return auth.authStateChanges();
});

final userViewModelProvider = ChangeNotifierProvider<UserViewModel>((ref) {
  return UserViewModel(ref: ref);
});