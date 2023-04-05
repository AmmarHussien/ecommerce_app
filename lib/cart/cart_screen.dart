import 'package:ecommerce_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My Cart'),
            backgroundColor: Colors.blueAccent,
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return cartItems(size);
              },
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: size.height / 12,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rs. 10000',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      height: size.height / 18,
                      width: size.width / 2.9,
                      alignment: Alignment.center,
                      color: Colors.blueAccent,
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cartItems(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      child: Container(
        height: size.height / 4,
        width: size.width / 1.05,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Column(
          children: [
            Expanded(
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
                            text: 'Product\n',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: '1000',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text: "   500  ",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '3 %Off',
                                style: TextStyle(
                                  fontSize: 15,
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
            const Text(
              'Will be Delivered in 7 days',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                'Remove From Cart',
              ),
              trailing: const Icon(
                Icons.delete_forever,
              ),
            )
          ],
        ),
      ),
    );
  }
}
