import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_screen/login_screen_view.dart';

final TextEditingController firstName = TextEditingController();
final TextEditingController lastName = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController phone = TextEditingController();
final TextEditingController password = TextEditingController();

class SingupScreenController extends GetxController {
  Future<User?> createAccount(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCrendetial =
          await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      if (kDebugMode) {
        print("Account created Succesfull");
      }

      userCrendetial.user!.updateDisplayName(firstName.text);

      await firestore.collection('users').doc(auth.currentUser!.uid).set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "useremail": email.text,
        'phone': phone.text,
        "uid": auth.currentUser!.uid,
      });

      Get.to(() => const LoginScreen());
      return userCrendetial.user;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
    return null;
  }
}
