import 'package:flutter/material.dart';
import 'package:hello/screens/login_screen.dart';
import 'package:hello/screens/registration_screen.dart';
import 'package:hello/components/rounded_buttons.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(79, 81, 84, 1.0),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                // color: Colors.green,
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
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: 'login',
                    child: RoundedButton(
                      color: Colors.green[700],
                      title: 'Login',
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                    )),
                SizedBox(
                  width: 50.0,
                ),
                Hero(
                    tag: 'registration',
                    child: RoundedButton(
                      color: Colors.greenAccent[700],
                      title: 'Registration',
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
