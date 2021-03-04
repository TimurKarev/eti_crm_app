import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier{

  String email;
  String name;
  String uid;
  List<String> roles;

  void update(User user) {
    uid = user?.uid;
    email = user?.email;
    notifyListeners();
  }
}