import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/ui/home_page.dart';
import 'package:eti_crm_app/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LandingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final userViewModel = watch(userViewModelProvider);
    Widget widget = CircularProgressIndicator();
    if (userViewModel.userModel.uid == null) {
      widget = LoginPage();
    } else {
      widget = HomePage();
    }

    return widget;
  }
}
