import 'package:ecommerce_app/Home/home_screen_controller.dart';
import 'package:ecommerce_app/cart/cart_screen.dart';
import 'package:ecommerce_app/items/items_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../categories/categories_and_featured_screen.dart';
import 'drawer.dart';
import '../model/categories_data_model.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final controller = Get.put(HomeScreenController());

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: GetBuilder<HomeScreenController>(
          builder: (value) {
            if (!value.isLoading) {
              return Scaffold(
                appBar: AppBar(
                  //automaticallyImplyLeading: false,
                  title: const Text(
                    'Ecommerce App',
                  ),
                  backgroundColor: Colors.blueAccent,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Get.to(
                          () => const CartScreen(),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                      ),
                    ),
                  ],
                ),
                drawer: const HomeScreenDrawer(),
                body: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // banner

                        SizedBox(
                          height: size.height / 3.5,
                          width: size.width / 1.1,
                          child: PageView.builder(
                            itemCount: controller.bannerData!.length,
                            onPageChanged: controller.changeIndecator,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        controller.bannerData![index].image),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        // indecator
                        SizedBox(
                            height: size.height / 25,
                            width: size.width,
                            child: Obx(() {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0;
                                      i < controller.isSelected.length;
                                      i++)
                                    indecator(
                                        size, controller.isSelected[i].value),
                                ],
                              );
                            })),

                        // categories..
                        categoriesTitle(
                          size,
                          'All Categories',
                          () {
                            Get.to(() => CategoriesAndFeaturedScreen(
                                  model: controller.categoriesData,
                                ));
                          },
                        ),

                        listViewBuilder(size, controller.categoriesData),

                        categoriesTitle(
                          size,
                          'Featured',
                          () {
                            Get.to(() => CategoriesAndFeaturedScreen(
                                  model: controller.featuredData,
                                ));
                          },
                        ),
                        listViewBuilder(size, controller.featuredData),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                height: size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
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

  Widget categoriesTitle(Size size, String title, Function function) {
    return SizedBox(
      height: size.height / 17,
      width: size.width / 1.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blueAccent,
            ),
            onPressed: () => function(),
            child: const Text(
              'View More',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewBuilder(
    Size size,
    List<CategoriesModel> data,
  ) {
    return SizedBox(
      height: size.height / 8,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return listViewBuilderItem(
            size,
            data[index],
          );
        },
      ),
    );
  }

  Widget listViewBuilderItem(Size size, CategoriesModel categories) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => ItemsScreen(
              categoryId: categories.id,
              categoryTitle: categories.title,
            ),
          );
        },
        child: SizedBox(
          height: size.height / 8,
          width: size.width / 4.2,
          child: Column(
            children: [
              Container(
                height: size.height / 10,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      categories.image,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                    categories.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
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
