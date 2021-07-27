import 'package:flutter/material.dart';
import 'package:hello/constants.dart';
import 'package:hello/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hello/components/rounded_buttons.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(79, 81, 84, 1.0),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                child: Text(
                  'Hello',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70.0,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your passowrd',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Hero(
              tag: 'login',
              child: RoundedButton(
                color: Colors.green[700],
                title: 'Login',
                onPressed: () async {
                  EasyLoading.show(status: 'Loading...');
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    EasyLoading.dismiss();
                  } catch (e) {
                    EasyLoading.showError('Invalid user or password');
                  }
                  EasyLoading.dismiss();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
