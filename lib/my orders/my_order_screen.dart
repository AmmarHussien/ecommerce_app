import 'package:ecommerce_app/my%20orders%20details/my_orders.details.dart';
import 'package:ecommerce_app/shared/const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My Orders'),
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return listViewBuilderItems(size);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget listViewBuilderItems(
    Size size,
  ) {
    // int descount = controller.calculateDiscount(
    //   itemsModel.totalPrice,
    //   itemsModel.sellingPrice,
    // );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => const MyOrdersDetailsScreen(
                //id: itemsModel.detailsId,
                ),
          );
        },
        child: SizedBox(
          height: size.height / 8,
          width: size.width / 1.1,
          child: Row(
            children: [
              Container(
                height: size.height / 8,
                width: size.width / 4.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 22,
              ),
              Expanded(
                child: SizedBox(
                  child: RichText(
                    text: const TextSpan(
                      text: '{itemsModel.title}\n',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'Status : Delivered',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
