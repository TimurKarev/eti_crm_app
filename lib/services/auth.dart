import 'package:firebase_auth/firebase_auth.dart';

class CloudFirebaseAuth {
  final _auth = FirebaseAuth.instance;

  Stream<User> authStateChanges() => _auth.authStateChanges();

  Future<User> signInAnonymously() async {
    final userCredential = await _auth.signInAnonymously();
    return userCredential.user;
  }
}