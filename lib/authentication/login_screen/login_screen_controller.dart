import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Home/home_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //final TextEditingController phone = TextEditingController();
  //final TextEditingController otp = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  String vId = '';
  bool isLoading = false;

  Future<User?> logIn(
    BuildContext context,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      firestore.collection('users').doc(auth.currentUser!.uid).get().then(
            (value) => userCredential.user!.updateDisplayName(
              value['firstName'],
            ),
          );
      Get.to(() => const HomeScreenView());
      return userCredential.user;
    } catch (error) {
      var message = ' An error occurred plase check your Credential';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      if (kDebugMode) {
        print(error);
      }
    }
    return null;
  }

//   void verifyPhoneNumber() async {
//     isLoading = true;

//     update();

//     try {
//       await _auth.verifyPhoneNumber(
//         phoneNumber: '+20${phone.text}',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await _auth.signInWithCredential(credential);
//           showAlert('Verifed');
//         },
//         verificationFailed: (FirebaseAuthException exception) {
//           isLoading = false;

//           update();
//           showAlert('Verification Failed');
//         },
//         codeSent: (String verificationId, int? forceRespondToken) {
//           showAlert('Verification code sent');

//           vId = verificationId;
//           Get.to(
//             () => const OtpVerficationScreen(),
//           );
//         },
//         timeout: const Duration(seconds: 60),
//         codeAutoRetrievalTimeout: (String verificationId) {
//           vId = verificationId;
//           print(vId);
//         },
//       );
//     } catch (e) {
//       showAlert('Error Occured: $e');
//     }
//   }

//   void signInWithPhoneNumber() async {
//     print('Kosom 7yaty');
//     print(vId);
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: vId.toString(),
//         smsCode: otp.text.trim(),
//       );

//       var signInUser = await _auth.signInWithCredential(credential);

//       final User? user = signInUser.user;

//       showAlert('Sign In Sucessfully, User UID: ${user!.uid}');

//       Get.to(() => const HomeScreenView());

//       if (kDebugMode) {
//         print('Sign In Sucessfully, User UID: ${user.uid}');
//       }
//     } catch (e) {
//       showAlert('Error Occured: $e');
//       print(e);
//     }
//   }
// }
}
