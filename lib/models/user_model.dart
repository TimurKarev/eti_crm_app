import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String email;
  String name;
  String uid;
  List<String> roles = ['not_assigned'];

  void updateFromUser(User user) {
    uid = user?.uid;
    email = user?.email;
  }

  void updateFromDataBase(Map<String, dynamic> dataBaseData) {
    roles = dataBaseData['security_group'].cast<String>();
  }
}
