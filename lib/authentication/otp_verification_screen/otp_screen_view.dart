import 'package:ecommerce_app/Home/home_screen_view.dart';
import 'package:ecommerce_app/shared/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerficationScreen extends StatelessWidget {
  const OtpVerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: size.height / 7,
                      width: size.width / 3,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(
                          230,
                          233,
                          250,
                          1,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                            1000,
                          ),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: size.width / 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Verify your\n Phone Number\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width / 12,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Enter OTP',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: size.width / 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 15,
                  ),
                  SizedBox(
                    height: size.height / 18,
                    width: size.width / 1.2,
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      onChanged: (String value) {},
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        fieldHeight: size.height / 18,
                        fieldWidth: size.width / 5,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  CustomButtom(
                    text: 'Submit',
                    function: () {
                      //controller.signInWithPhoneNumber();
                      Get.to(() => const HomeScreenView());
                    },
                    buttomWidth: 2.5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
