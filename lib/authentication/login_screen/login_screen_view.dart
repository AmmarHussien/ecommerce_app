import 'package:ecommerce_app/authentication/login_screen/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/custom_buttom.dart';
import '../singup_screen/singup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final controller = Get.put(LoginScreenController());

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(child: Scaffold(
        body: GetBuilder<LoginScreenController>(
          builder: (value) {
            if (!value.isLoading) {
              return SizedBox(
                height: size.height,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Material(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(
                            100,
                          ),
                        ),
                        color: const Color.fromRGBO(
                          230,
                          233,
                          250,
                          1,
                        ),
                        child: SizedBox(
                          height: size.height / 2,
                          width: size.width,
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height / 10,
                              ),
                              Text(
                                'E-Commerce',
                                style: TextStyle(
                                  color: const Color.fromRGBO(
                                    9,
                                    32,
                                    196,
                                    1,
                                  ),
                                  fontSize: size.width / 9,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(
                                height: size.height / 60,
                              ),
                              Text(
                                "'it's all easy when it's at Home'",
                                style: TextStyle(
                                  color: const Color.fromRGBO(
                                    90,
                                    106,
                                    165,
                                    1,
                                  ),
                                  fontSize: size.width / 21,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: size.height / 9,
                              ),
                              SizedBox(
                                width: size.width / 1.2,
                                child: Row(
                                  children: [
                                    Container(
                                      height: size.height / 10,
                                      width: size.width / 150,
                                      color: const Color.fromRGBO(
                                        9,
                                        32,
                                        196,
                                        1,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width / 40,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Welcom\n',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.width / 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                'Enter the Fetails to login/signin.',
                                            style: TextStyle(
                                              color: const Color.fromRGBO(
                                                138,
                                                132,
                                                134,
                                                1,
                                              ),
                                              fontSize: size.width / 22,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                      ),
                      Container(
                        alignment: Alignment.center,
                        //height: size.height / 10,
                        width: size.width / 1.2,
                        decoration: const BoxDecoration(
                            // borderRadius: BorderRadius.circular(
                            //   10,
                            // ),
                            // border: Border.all(
                            //   width: 1,
                            //   color: const Color.fromRGBO(
                            //     9,
                            //     32,
                            //     196,
                            //     1,
                            //   ),
                            // ),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: controller.email,
                                //maxLength: 10,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintMaxLines: 15,
                                  hintText: 'Email',
                                  counterText: '',
                                  label: const Text(
                                    'Email',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height / 170,
                              ),
                              TextFormField(
                                controller: controller.password,
                                //maxLength: 10,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintMaxLines: 15,
                                  hintText: 'Password',
                                  counterText: '',
                                  label: const Text(
                                    'Password',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 50,
                      ),
                      CustomButtom(
                        text: 'Login',
                        buttomWidth: 2.8,
                        function: () {
                          controller.logIn(context);
                          // Get.to(
                          //   () => const OtpVerficationScreen(),
                          //);
                        },
                        radius: BorderRadius.circular(10),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const SingupScreen());
                        },
                        child: const Text('Signup'),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )),
    );
  }
}
