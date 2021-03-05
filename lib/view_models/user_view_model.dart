import 'package:cloud_firestore/cloud_firestore.dart';
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
  String get uid => _userModel.uid;
  String get email => _userModel.email;

  void authStateChangeListener() {
    AsyncValue<User> userStream = ref.watch(authStateChangeProvider);
    userStream.when(
      data: (user) async {
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

  void signOut() {
    ref.read(authProvider).signOut();
  }

  void signIn({String email, String password}) {
    ref.read(authProvider).signInEmailAndPassword(email: email, password: password);
  }

  Future<DocumentSnapshot> _getUserPrefFromDataBase() async {
    final DocumentReference reference = FirebaseFirestore.instance.doc('/users/$uid');
    DocumentSnapshot snapshot;
    try {
      snapshot = await reference.get();
      if(snapshot.data() == null) {
        await reference.set({'security_group' : ['viewer']});
        snapshot = await reference.get();
        if(snapshot.data() == null) {
          throw('Can not read user info from database');
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return snapshot;
  }
}
