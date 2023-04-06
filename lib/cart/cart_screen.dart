import 'package:ecommerce_app/cart/cart_controller_screen.dart';
import 'package:ecommerce_app/model/item_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.put(CartControllerScreen());
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: GetBuilder<CartControllerScreen>(
          builder: (value) {
            if (!controller.isLoading) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('My Cart'),
                  backgroundColor: Colors.blueAccent,
                ),
                body: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: ListView.builder(
                    itemCount: controller.productsDetails.length,
                    itemBuilder: (context, index) {
                      return cartItems(
                        size,
                        controller.productsDetails[index],
                      );
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
                          onTap: () {},
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

  Widget cartItems(Size size, ItemDetailModel detailModel) {
    int discount = controller.calculateDiscount(
      detailModel.totalPrice,
      detailModel.sellingPrice,
    );
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(detailModel.img),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width / 22,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: RichText(
                          text: TextSpan(
                            text: '${detailModel.title}}\n',
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: '${detailModel.totalPrice}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text: '  ${detailModel.sellingPrice} ',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '$discount %Off',
                                style: const TextStyle(
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
            Text(
              'Will be Delivered in ${detailModel.deliveryDays} days',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            ListTile(
              onTap: () {
                controller.removeFromCart(detailModel.id);
              },
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
