import 'package:ecommerce_app/Home/model/items_model.dart';
import 'package:ecommerce_app/items/item_controller_screen.dart';
import 'package:ecommerce_app/items/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'items_details/item_details_screen.dart';

class ItemsScreen extends StatelessWidget {
  ItemsScreen({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
  });

  final controller = Get.put(ItemControlleScreen());

  String categoryId;
  String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    controller.categoryTitle = categoryTitle;
    controller.categoryId = categoryId;

    controller.getPaginedData();

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(categoryTitle),
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
                searchBar(
                  size,
                  context,
                ),
                Expanded(
                  child: SizedBox(
                    child: GetBuilder<ItemControlleScreen>(
                      builder: (value) {
                        if (!value.isLoading) {
                          return ListView.builder(
                            controller: controller.scrollController,
                            itemCount: controller.itemsData.length,
                            itemBuilder: (context, index) {
                              return listViewBuilderItems(
                                size,
                                controller.itemsData[index],
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Obx(() {
                  if (controller.isLoadingData.value) {
                    return Container(
                      height: size.height / 10,
                      width: size.width,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    );
                  } else {
                    return const SizedBox();
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listViewBuilderItems(Size size, ItemsModel itemsModel) {
    int descount = controller.calculateDiscount(
      itemsModel.totalPrice,
      itemsModel.sellingPrice,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(() => const ItemScreenDetails());
        },
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
                    image: NetworkImage(itemsModel.img),
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
                      text: '${itemsModel.title}\n',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: '${itemsModel.totalPrice}',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        TextSpan(
                          text: "   ${itemsModel.sellingPrice}  ",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '$descount %Off',
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
    );
  }

  Widget searchBar(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: SearchScreen(),
        );
      },
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
        child: Container(
          height: size.height / 14,
          width: size.width / 1.1,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Search Here...',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.search_sharp,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
