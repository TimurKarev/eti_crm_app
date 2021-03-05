import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  String email;
  String name;
  String uid;
  List<String> roles = [];

  void updateFromUser(User user) {
    uid = user?.uid;
    email = user?.email;
  }

  void updateFromDataBase(Map<String, dynamic> dataBaseData) {
   roles = dataBaseData['security_group'].cast<String>();
  }
}
