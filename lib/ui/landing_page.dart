import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eti_crm_app/services/auth.dart';

class LandingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<User> asyncAuth = watch(authStateChangeProvider);
    final CloudFirebaseAuth auth = watch(authProvider);
    return asyncAuth.when(
        data: (user) {
          if (user == null) {
            return LoginPage();
          } else {
            return Text('Logineg');
          }
        },
        loading: () => CircularProgressIndicator(),
        error: (e, stack) => Text("${e.toString()}"));
  }
}
