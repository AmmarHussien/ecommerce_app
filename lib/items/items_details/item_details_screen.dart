import 'package:ecommerce_app/cart/cart_screen.dart';
import 'package:ecommerce_app/items/items_details/item_details_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/const.dart';

class ItemScreenDetails extends StatelessWidget {
  String id;
  ItemScreenDetails({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    final controller = Get.put(ItemDetailController());

    controller.getItemDetails(id);

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: GetBuilder<ItemDetailController>(
          builder: (value) {
            if (!controller.isLoading) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Product details'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Get.to(
                          () =>  CartScreen(),
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
                            itemCount: controller.modelDetail.banners.length,
                            //onPageChanged: controller.changeIndecator,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller.modelDetail.banners[index],
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
                              for (int i = 0;
                                  i < controller.modelDetail.banners.length;
                                  i++)
                                indecator(size, false),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height / 25,
                        ),
                        SizedBox(
                          width: size.width / 1.1,
                          child: Text(
                            controller.modelDetail.title,
                            style: const TextStyle(
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
                            text: TextSpan(
                              text: '${controller.modelDetail.totalPrice}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      ' ${controller.modelDetail.sellingPrice}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                TextSpan(
                                  text: "  ${controller.discount} % off  ",
                                  style: const TextStyle(
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
                          child: Text(
                            controller.modelDetail.description,
                            style: const TextStyle(
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
                            if (controller.isAlreadyAvalibale) {
                              Get.to(() =>  CartScreen());
                            } else {
                              controller.addItemsToCart();
                            }
                          },
                          Colors.redAccent,
                          controller.isAlreadyAvalibale
                              ? 'Go to Cart'
                              : " Add To Cart",
                        ),
                      ),
                      Expanded(
                        child: customBottom(
                          size,
                          () {
                            if (kDebugMode) {
                              print('Buy Now');
                            }
                          },
                          Colors.white,
                          'Buy Now',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
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
