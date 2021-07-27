import 'package:flutter/material.dart';
import 'package:hello/screens/chat_screen.dart';
import 'package:hello/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hello/components/rounded_buttons.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'Registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
              ),
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
                hintText: 'Create your passowrd',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Hero(
                tag: 'registration',
                child: RoundedButton(
                  color: Colors.green[700],
                  title: 'Registration',
                  onPressed: () async {
                    EasyLoading.show(status: 'loading');
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      EasyLoading.showSuccess('Success');
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e) {
                      EasyLoading.showError('User already exist');
                    }
                    EasyLoading.dismiss();
                  },
                )),
          ],
        ),
      ),
    );
  }
}
