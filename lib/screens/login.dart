import 'package:flutter/material.dart';
import 'package:flutter_app/models/api_response.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/nav.dart';
import 'package:flutter_app/services/user_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Nav()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
          // padding: EdgeInsets.all(32),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 150),

          children: [
            Image.asset(
              'images/logo.png',
              height: 100,
            ), // Update with your logo path

            SizedBox(height: 16),
            // Your brand name or app name
            Align(
              alignment: Alignment.center,
              child: Text(
                'Thin U',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: txtEmail,
                validator: (val) =>
                    val!.isEmpty ? 'Invalid email address' : null,
                decoration: kInputDecoration('Email')),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: txtPassword,
                obscureText: true,
                validator: (val) =>
                    val!.length < 6 ? 'Required at least 6 chars' : null,
                decoration: kInputDecoration('Password')),
            SizedBox(
              height: 10,
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : kTextButton('Login', () {
                    if (formkey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                        _loginUser();
                      });
                    }
                  }),
            SizedBox(
              height: 10,
            ),
            kLoginRegisterHint('Dont have an account? ', 'Register', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Register()),
                  (route) => false);
            })
          ],
        ),
      ),
    );
  }
}
