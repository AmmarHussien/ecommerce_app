import 'package:ecommerce_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Electronics'),
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
                searchBar(size),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return listViewBuilderItems(size);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listViewBuilderItems(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
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
              width: size.width / 20,
            ),
            Expanded(
              child: SizedBox(
                child: RichText(
                  text: const TextSpan(
                    text: 'Item name\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'price',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '20% off',
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
    );
  }

  Widget searchBar(Size size) {
    return GestureDetector(
      onTap: () {},
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
