import 'package:ecommerce_app/Home/home_screen_view.dart';
import 'package:ecommerce_app/authentication/login_screen/login_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  Authentication({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null) {
      return const HomeScreenView();
    } else {
      return const LoginScreen();
    }
  }
}
