import 'package:ecommerce_app/Home/home_screen_view.dart';
import 'package:ecommerce_app/authentication/otp_verification_screen/otp_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/alert.dart';

class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController phone = TextEditingController();
  final TextEditingController otp = TextEditingController();

  String verificationId = '';
  bool isLoading = false;

  void verifyPhoneNumber() async {
    isLoading = false;

    update();
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+201146082989',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          showAlert('Verifed');
        },
        verificationFailed: (FirebaseAuthException exception) {
          showAlert('Verification Failed');
        },
        codeSent: (String verificationID, int? forceRespondToken) {
          showAlert('Verification code sent');

          verificationId = verificationID;
          Get.to(
            () => const OtpVerficationScreen(),
          );
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          verificationId = verificationID;
        },
      );
    } catch (e) {
      showAlert('Error Occured: $e');
    }
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp.text,
      );

      var signInUser = await _auth.signInWithCredential(credential);

      final User? user = signInUser.user;

      showAlert('Sign In Sucessfully, User UID: ${user!.uid}');

      Get.to(() => const HomeScreenView());

      if (kDebugMode) {
        print('Sign In Sucessfully, User UID: ${user.uid}');
      }
    } catch (e) {
      showAlert('Error Occured: $e');
    }
  }
}
