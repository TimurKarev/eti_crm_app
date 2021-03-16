import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationPage extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Future<void> _register(
      {@required BuildContext context,
      @required String name,
      @required String email,
      @required String password}) async {
    await context
        .read(userViewModelProvider)
        .register(email: email, password: password, name: name);
  }

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Зарегестрировать нового пользователя'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              _navigateToLogin(context);
            },
            child: Text('Войти'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 60.0),
            Text('Зарегестрироваться', textAlign: TextAlign.center),
            SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Имя',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Почта',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Пароль',
              ),
            ),
            SizedBox(height: 30.0),
            SizedBox(
              height: 40.0,
              child: ElevatedButton(
                onPressed: () async {
                  await _register(
                      context: context,
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text);
                },
                child: Text('Войти'),
              ),
            ),
            SizedBox(height: 30.0),
            FlatButton(
              onPressed: () {
                _navigateToLogin(context);
              },
              child: Text('Есть пароль? Войти в программу'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToLogin(BuildContext ctx) {
    Navigator.pushAndRemoveUntil(ctx,
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }
}
