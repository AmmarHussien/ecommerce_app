import 'package:ecommerce_app/items/items_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Home/model/categories_data_model.dart';

class CategoriesAndFeaturedScreen extends StatelessWidget {
  const CategoriesAndFeaturedScreen({super.key, required this.model});

  final List<CategoriesModel> model;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'All Categories',
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: model.length,
              itemBuilder: (context, index) {
                return gridViewBuilderItem(Get.size, model[index]);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget gridViewBuilderItem(Size size, CategoriesModel categories) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => const ItemsScreen(),
          );
        },
        child: SizedBox(
          height: size.height / 7,
          width: size.width / 4.2,
          child: Column(
            children: [
              Container(
                height: size.height / 8,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      categories.image,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                    categories.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
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
