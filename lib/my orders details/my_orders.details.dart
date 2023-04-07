import 'package:ecommerce_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrdersDetailsScreen extends StatelessWidget {
  const MyOrdersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Product Name',
            ),
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Container(
                    height: size.height / 5,
                    width: size.width / 1.1,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  const Text(
                    'Product name',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  orderDateils(size),
                ],
              ),
            ),
          ),
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
              'Order Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height / 60,
            ),
            text(
              'Order Id:',
              '1543927684327600',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: text(
                'Total Price:',
                '\$ 50000',
              ),
            ),
            text(
              'Paid Amount :',
              '\$ 40000',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: text(
                'Status:',
                'Delivered',
              ),
            ),
            text(
              'Order On :',
              '24-10-2022',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: text(
                'Delivered on:',
                '28-10-2022',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
