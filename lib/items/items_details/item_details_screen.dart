import 'package:ecommerce_app/cart/cart_screen.dart';
import 'package:ecommerce_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class ItemScreenDetails extends StatelessWidget {
  const ItemScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Product details'),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(
                    () => const CartScreen(),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_sharp,
                ),
              ),
            ],
            backgroundColor: Colors.blueAccent,
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 3.5,
                    width: size.width / 1.1,
                    child: PageView.builder(
                      itemCount: 3,
                      //onPageChanged: controller.changeIndecator,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                image,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height / 25,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++) indecator(size, false),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  SizedBox(
                    width: size.width / 1.1,
                    child: const Text(
                      'LED TV',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 45,
                  ),
                  SizedBox(
                    width: size.width / 1.1,
                    child: RichText(
                      text: const TextSpan(
                        text: '48,000',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                        ),
                        children: [
                          TextSpan(
                            text: ' 40,000',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "   40% off  ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  SizedBox(
                    width: size.width / 1.1,
                    child: const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  SizedBox(
                    width: size.width / 1.1,
                    child: const Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text('See Reviews'),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    leading: const Icon(
                      Icons.star,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: size.height / 15,
            width: size.width,
            child: Row(
              children: [
                Expanded(
                  child: customBottom(
                    size,
                    () {
                      print('Add to Cart');
                    },
                    Colors.redAccent,
                    'Add to Cart',
                  ),
                ),
                Expanded(
                  child: customBottom(
                    size,
                    () {
                      print('Buy Now');
                    },
                    Colors.white,
                    'Buy Now',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customBottom(Size size, Function function, Color color, String title) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: color == Colors.redAccent ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget indecator(Size size, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: isSelected ? size.height / 80 : size.height / 100,
        width: isSelected ? size.height / 80 : size.height / 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }
}
