import 'package:flutter/material.dart';

import '../shared/const.dart';
import 'drawer.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            //automaticallyImplyLeading: false,
            title: const Text(
              'Ecommerce App',
            ),
            backgroundColor: Colors.blueAccent,
            actions: [
              IconButton(
                onPressed: () {},
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
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: NetworkImage(image)),
                          ),
                        );
                      },
                    ),
                  ),

                  // indecator
                  SizedBox(
                    height: size.height / 25,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 4; i++) indecator(size, false),
                      ],
                    ),
                  ),

                  // categories..
                  categoriesTitle(
                    size,
                    'All Categories',
                    () {},
                  ),

                  listViewBuilder(size),

                  categoriesTitle(
                    size,
                    'Featured',
                    () {},
                  ),
                  listViewBuilder(size),
                ],
              ),
            ),
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
  ) {
    return SizedBox(
      height: size.height / 8,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return listViewBuilderItem(
            size,
            images[index],
          );
        },
      ),
    );
  }

  Widget listViewBuilderItem(Size size, Categories categories) {
    return Container(
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
                  categories.img,
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
    );
  }
}
