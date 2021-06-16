import 'package:flutter/material.dart';
import 'package:bachmanity/screens/chat_page.dart';
import 'package:bachmanity/screens/login_page.dart';
import 'package:bachmanity/screens/registration_page.dart';
import 'package:bachmanity/screens/welcome_page.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomePage(),
    );
  }
}
