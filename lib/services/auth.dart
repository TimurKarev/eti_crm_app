import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CloudFirebaseAuth {
  final _auth = FirebaseAuth.instance;

  Stream<User> authStateChanges() => _auth.userChanges();

  Future<User> signInAnonymously() async {
    final userCredential = await _auth.signInAnonymously();
    return userCredential.user;
  }

  Future<User> signInEmailAndPassword(
      {@required String email, @required String password}) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> createUserWithEmailAndPassword(
  {String email, String password}) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('User cred  ' + userCredential.toString());
    await userCredential.user.reload();
    //_auth.userChanges();
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
