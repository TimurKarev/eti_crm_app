import 'package:flutter/material.dart';

class ChecklistAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(50);

  const ChecklistAppBar({
    Key key,
    @required this.titleText,
  }) : super(key: key);

  final String titleText;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      actions: <Widget>[
        FlatButton.icon(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r)=>false),
          icon: Icon(Icons.home),
          label: Text(''),
        )
      ],
    );
  }
}
