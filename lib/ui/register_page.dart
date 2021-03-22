import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Зарегестрировать нового пользователя'),
        actions: <Widget>[
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
              obscureText: true,
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
                  try {
                    await _register(
                        context: context,
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text);
                  } finally {
                    Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
                  }
                },
                child: Text('Зарегестрироваться'),
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  void _navigateToLogin(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
