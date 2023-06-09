import 'package:ecommerce_app/confirmation/confirmation_controller_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen({super.key});

  final controller = Get.put(ConfirmationControllerScreen());

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Confirmation',
            ),
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
                SizedBox(
                  height: size.height / 40,
                ),
                orderDateils(size),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {},
            child: Container(
              height: size.height / 18,
              width: size.width / 1.1,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: const Text(
                'Pay Now',
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
            // SizedBox(
            //   height: size.height / 30,
            // ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     height: size.height / 18,
            //     width: size.width / 1.1,
            //     color: Colors.blueAccent,
            //     alignment: Alignment.center,
            //     child: Text(
            //       'Edit',
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.w500,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget orderDateils(Size size) {
    Widget text(String header, String footer) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            footer,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

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
            const Text(
              'Price Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height / 60,
            ),
            text(
              'Total Price:',
              '\$ ${controller.totalPrice}',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: text(
                'Discount:',
                '\$ ${controller.totalDiscount}',
              ),
            ),
            text(
              'Payable Price :',
              '\$ ${controller.payablePrice}',
            ),
          ],
        ),
      ),
    );
  }
}
