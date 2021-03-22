import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'checklists/data_table_page.dart';

class LandingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(userModelStreamProvider).when(
        data: (model) {
          if (model?.uid == null) {
            return LoginPage();
          }
          return DataTablePage();
        },
        loading: () => CircularProgressIndicator(),
        error: (e, _) {
          print(e.toString());
          return Text('${e.toString()}');
        });
  }
}
