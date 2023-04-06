import 'package:ecommerce_app/authentication/singup_screen/singup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/custom_buttom.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final controller = Get.put(SingupScreenController());

    // final TextEditingController _firstName = TextEditingController();
    // final TextEditingController _lastName = TextEditingController();
    // final TextEditingController _email = TextEditingController();
    // final TextEditingController _phoneNumber = TextEditingController();
    //final TextEditingController _password = TextEditingController();

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
                  height: size.height / 50,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Please\n Enter Your Credentialsl\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width / 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 45,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    //height: size.height / 30,
                    width: size.width / 1.1,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: firstName,
                          //maxLength: 10,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintMaxLines: 15,
                            hintText: 'Frist Name',
                            //counterText: '',
                            label: const Text(
                              'Frist Name',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 45,
                        ),
                        TextFormField(
                          controller: lastName,
                          // maxLength: 10,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintMaxLines: 15,
                            hintText: 'Last Name',
                            counterText: '',
                            label: const Text(
                              'Last Name',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 45,
                        ),
                        TextFormField(
                          controller: phone,
                          maxLength: 11,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintMaxLines: 15,
                            hintText: 'Phone Number',
                            counterText: '',
                            label: const Text(
                              'Phone Number',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 45,
                        ),
                        TextFormField(
                          controller: email,
                          //maxLength: 10,
                          keyboardType: TextInputType.emailAddress,
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
                          height: size.height / 45,
                        ),
                        TextFormField(
                          controller: password,
                          //maxLength: 10,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintMaxLines: 15,
                            hintText: 'password',
                            counterText: '',
                            label: const Text(
                              'password',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                CustomButtom(
                  text: 'Submit',
                  function: () {
                    controller.createAccount(
                      context,
                    );
                    //controller.signInWithPhoneNumber();
                    // Get.to(() => const HomeScreenView());
                  },
                  buttomWidth: 2.5,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
