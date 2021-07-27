import 'package:flutter/material.dart';
import 'package:hello/screens/welcome_screen.dart';
import 'package:hello/screens/login_screen.dart';
import 'package:hello/screens/registration_screen.dart';
import 'package:hello/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Hello());
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? WelcomeScreen.id
          : ChatScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      builder: EasyLoading.init(),
    );
  }
}
