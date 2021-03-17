import 'package:eti_crm_app/services/cloud_firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserModel {
  String email;
  String name = 'Незнакомец';
  String uid;
  Set<String> roles = {'not_assigned'};

}
