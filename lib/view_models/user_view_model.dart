import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eti_crm_app/models/user_model.dart';
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

class UserViewModel extends ChangeNotifier {
  ProviderReference ref;
  UserModel _userModel = UserModel();

  UserViewModel({@required this.ref}) {
    //_authStateChangeListener();
  }

  UserModel get userModel => _userModel;

  String get uid => _userModel.uid;

  String get email => _userModel.email;

  Stream<UserModel> userModelStream() {
    final user = ref.watch(authStateChangeProvider);
    // return user.map((event) {
    //   userModel.updateFromUser(event);
    //   return userModel;
    // });
    return user.when(data: (data) async* {
      print('stream user change');
      userModel.updateFromUser(data);
      yield userModel;
    }, loading: () async* {
      yield userModel;
    }, error: (e, _) async* {
      yield userModel;
    });
  }

  void _authStateChangeListener() {
    AsyncValue<User> userStream = ref.watch(authStateChangeProvider);
    userStream.when(
      data: (user) async {
        print('state changed');
        _userModel.updateFromUser(user);
        if (uid != null) {
          final userSnapshot = await _getUserPrefFromDataBase();
          _userModel.updateFromDataBase(userSnapshot.data());
        }
        notifyListeners();
      },
      loading: () {},
      error: (e, stack) {
        print("${e.toString()}");
      },
    );
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
    await ref
        .read(authProvider)
        .createUserWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  //TODO: Нужен серьезный рефакторинг
  Future<DocumentSnapshot> _getUserPrefFromDataBase() async {
    final DocumentReference reference =
        FirebaseFirestore.instance.doc(FirestorePath.user(uid));
    DocumentSnapshot snapshot;
    try {
      snapshot = await reference.get();
      if (snapshot.data() == null) {
        await reference.set({
          'security_group': ['not_assigned']
        });
        snapshot = await reference.get();
        if (snapshot.data() == null) {
          throw ('Can not read user info from database');
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return snapshot;
  }
}
