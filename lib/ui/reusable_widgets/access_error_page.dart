import 'package:flutter/material.dart';

class AccessErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ошибка прав доступа')),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            child: Text(
              'Нехватает прав доступа',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ),
    );
  }
}
