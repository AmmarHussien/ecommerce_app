import 'package:ecommerce_app/adrresss/address_controller_screen.dart';
import 'package:ecommerce_app/confirmation/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressControllerScreen>(
      init: AddressControllerScreen(),
      builder: (value) {
        if (value.isAddressAvailable) {
          return EditAddressScreen();
        } else {
          return AddAddressScreen();
        }
      },
    );
  }
}

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});

  final contoller = Get.find<AddressControllerScreen>();
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Address'),
            backgroundColor: Colors.blueAccent,
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 40,
                ),
                SizedBox(
                  height: size.height / 11,
                  width: size.width / 1.1,
                  child: TextFormField(
                    controller: contoller.nameController,
                    maxLength: 20,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                SizedBox(
                  height: size.height / 5,
                  width: size.width / 1.1,
                  child: TextFormField(
                    controller: contoller.addressController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                SizedBox(
                  height: size.height / 11,
                  width: size.width / 1.1,
                  child: TextFormField(
                    controller: contoller.pincodeController,
                    decoration: InputDecoration(
                      hintText: 'Pin Code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              contoller.onTap();
            },
            child: Container(
              height: size.height / 15,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: const Text(
                'Proceed',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditAddressScreen extends StatelessWidget {
  EditAddressScreen({super.key});

  final controller = Get.find<AddressControllerScreen>();

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Address'),
            backgroundColor: Colors.blueAccent,
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                addresscard(size),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              Get.to(() => ConfirmationScreen());
            },
            child: Container(
              height: size.height / 18,
              width: size.width / 1.1,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: const Text(
                'Procees',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget addresscard(Size size) {
    return Material(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        width: size.width / 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                controller.address,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              controller.pincode,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            GestureDetector(
              onTap: () {
                controller.onEdit();
              },
              child: Container(
                height: size.height / 18,
                width: size.width / 1.1,
                color: Colors.blueAccent,
                alignment: Alignment.center,
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
