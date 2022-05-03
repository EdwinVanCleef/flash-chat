// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: WelcomeScreen.screen_id, routes: {
      LoginScreen.screen_id: ((context) => LoginScreen()),
      WelcomeScreen.screen_id: ((context) => WelcomeScreen()),
      ChatScreen.screen_id: ((context) => ChatScreen()),
      RegistrationScreen.screen_id: ((context) => RegistrationScreen()),
    });
  }
}
