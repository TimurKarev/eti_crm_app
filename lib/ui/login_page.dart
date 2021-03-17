import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/ui/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(
      {@required BuildContext context,
      @required String email,
      @required String password}) async {
    await context
        .read(userViewModelProvider)
        .signIn(email: email, password: password);
  }

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Войти используя пароль'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              _navigateToRegister(context);
            },
            child: Text('Зарегестрироваться'),
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
            Text('Войти в программу', textAlign: TextAlign.center),
            SizedBox(height: 20.0),
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
                  await _login(
                      context: context,
                      email: _emailController.text,
                      password: _passwordController.text);
                  Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
                },
                child: Text('Войти'),
              ),
            ),
            SizedBox(height: 30.0),
            FlatButton(
              onPressed: () {
                _navigateToRegister(context);
              },
              child: Text('Нет пароля? Зарегестрироваться'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToRegister(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => RegistrationPage()),
    );
  }
}
