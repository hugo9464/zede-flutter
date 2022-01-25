// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zede_app/models/User.dart';
import 'package:zede_app/screens/main/main_screen.dart';
import 'package:zede_app/screens/profile_page.dart';
import 'package:zede_app/screens/auth/register_page.dart';
import 'package:zede_app/services/api/UserService.dart';
import 'package:zede_app/utils/fire_auth.dart';
import 'package:zede_app/utils/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                'Content de vous revoir !',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(fontFamily: 'VentiCF-Bold'),
                    controller: _emailTextController,
                    focusNode: _focusEmail,
                    validator: (value) => Validator.validateEmail(
                      email: value,
                    ),
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    style: TextStyle(fontFamily: 'VentiCF-Bold'),
                    controller: _passwordTextController,
                    focusNode: _focusPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Mot de passe",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      _focusEmail.unfocus();
                      _focusPassword.unfocus();

                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        User user = await UserService.signIn(
                            email: _emailTextController.text,
                            password: _passwordTextController.text);

                        setState(() {
                          _isProcessing = false;
                        });

                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => MainScreen(user: user),
                            ),
                          );
                        }
                      }
                    },
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'JE ME CONNECTE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'VentiCF-Bold'),
                        )),
                  ),
                  SizedBox(
                    width: 24.0,
                    height: 40.0,
                  ),
                  Text(
                    'Pas encore membre de ZÈDE ?',
                    style:
                        TextStyle(fontSize: 20.0, fontFamily: 'VentiCF-Light'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      'CRÉER MON COMPTE',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20.0,
                          fontFamily: 'VentiCF-Light',
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
