import 'package:eti_crm_app/models/user_model.dart';
import 'package:eti_crm_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider<CloudFirebaseAuth>((ref) {
  return CloudFirebaseAuth();
});

final authStateChangeProvider = StreamProvider<User>((ref) {
  final auth = ref.watch(authProvider);
  return auth.authStateChanges();
});

class UserViewModel extends ChangeNotifier {
  ProviderReference ref;
  UserModel _userModel = UserModel();

  UserViewModel({@required this.ref}) {
    authStateChangeListener();
  }

  UserModel get userModel => _userModel;

  void authStateChangeListener() {
    AsyncValue<User> userStream = ref.watch(authStateChangeProvider);
    userStream.when(
      data: (user) {
        _userModel.updateFromUser(user);
        notifyListeners();
      },
      loading: () {},
      error: (e, stack) {
        print("${e.toString()}");
      },
    );
  }

  void signOut() {
    ref.read(authProvider).signOut();
  }

  void signIn({String email, String password}) {
    ref.read(authProvider).signInEmailAndPassword(email: email, password: password);
  }
}
