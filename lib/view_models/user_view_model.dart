import 'package:eti_crm_app/models/user_model.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserViewModel extends ChangeNotifier {
  ProviderReference ref;

  UserViewModel({@required this.ref}) {
    listener();
  }

  UserModel userModel = UserModel();

  void listener() {
    AsyncValue<User> userStream = ref.watch(authStateChangeProvider);
    userStream.when(
      data: (user) {
        userModel.updateFromUser(user);
        notifyListeners();
      },
      loading: () {},
      error: (e, stack) {
        print("${e.toString()}");
      },
    );
  }
}
