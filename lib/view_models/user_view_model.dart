import 'package:eti_crm_app/models/user_model.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/auth.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
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

class UserViewModel {
  ProviderReference ref;
  UserModel _userModel = UserModel();

  UserViewModel({@required this.ref}) {
    //_authStateChangeListener();
  }

  UserModel get userModel => _userModel;

  String get uid => _userModel.uid;

  String get email => _userModel.email;

  Set<String> get roles => _userModel.roles;

  Stream<UserModel> userModelStream() {
    final user = ref.watch(authStateChangeProvider);
    return user.when(data: (data) async* {
      await _updateUserModel(data);
      yield userModel;
    }, loading: () async* {
      yield userModel;
    }, error: (e, _) async* {
      yield userModel;
    });
  }

  Future<void> _updateUserModel(User user) async {
    if (user?.uid == null) {
      return null;
    }
    userModel.uid = user.uid;
    userModel.email = user.email;
    try {
      await ref
          .read(cloudFirebaseServiceProvider)
          .getDocument(path: FirestorePath.user(user.uid))
          .then((value) {
        print(value.toString());
        if (value != null) {
          userModel.name = value['name'];
          final List<String> roles = value['roles'].cast<String>();
          userModel.roles = roles.toSet();
        }
      });
    } catch (e) {
      print(e.toString());
      userModel.uid = null;
      userModel.email = null;
      userModel.name = 'Незнакомец';
      userModel.roles = {'not_assigned'};
    }
  }

  Future<void> signOut() async {
    await ref.read(authProvider).signOut();
  }

  Future<void> signIn({String email, String password}) async {
    await ref
        .read(authProvider)
        .signInEmailAndPassword(email: email, password: password);
  }

  Future<void> register({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    final userCredentials = await ref
        .read(authProvider)
        .createUserWithEmailAndPassword(email: email, password: password);
    final data = {
      'name': name,
      'roles': {'not_assigned'}
    };
    await ref.read(cloudFirebaseServiceProvider).setDocument(
        path: FirestorePath.user(userCredentials.user.uid), data: data);
  }
}
