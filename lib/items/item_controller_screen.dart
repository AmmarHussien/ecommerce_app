import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemControlleScreen extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ScrollController scrollController = ScrollController();

  String categoryId = '';
  String categoryTitle = '';
  List<ItemsModel> itemsData = [];
  List<ItemsModel> searchResults = [];
  bool isLoading = true;
  bool isSearchLoading = false;
  bool hasMoreData = true;
  var isLoadingData = false.obs;
  DocumentSnapshot? lastDocument;
  int documentLimit = 7;

  Future<void> getSubCategoryData() async {
    try {
      await _firestore
          .collection('categories')
          .doc(categoryId)
          .collection(categoryTitle)
          .get()
          .then((value) {
        itemsData = value.docs
            .map(
              (e) => ItemsModel.fromJson(
                e.data(),
              ),
            )
            .toList();

        isLoading = false;
        update();
      });
    } catch (e) {
      print(e);
    }
  }

  int calculateDiscount(int totalPrice, int sellPrice) {
    double discount = ((totalPrice - sellPrice) / totalPrice) * 100;
    return discount.toInt();
  }

  Future<void> searchProducts(String query) async {
    if (query.isNotEmpty) {
      isSearchLoading = true;
      Future.delayed(Duration.zero, () {
        update();
      });

      try {
        await _firestore
            .collection('categories')
            .doc(categoryId)
            .collection(categoryTitle)
            .where('title', isGreaterThanOrEqualTo: query)
            .get()
            .then((value) {
          searchResults = value.docs
              .map(
                (e) => ItemsModel.fromJson(
                  e.data(),
                ),
              )
              .toList();
        });

        isSearchLoading = false;
        update();
      } catch (e) {
        print(e);
      }
    }
  }

  void getPaginedData() async {
    if (hasMoreData) {
      if (!isLoadingData.value) {
        await getSubCategoryData();
      }
    } else {
      print('No more data');
    }
  }

  Future<void> getSubGategoryDataInParts() async {
    if (lastDocument == null) {
      await _firestore
          .collection('categories')
          .doc(categoryId)
          .collection(categoryTitle)
          .orderBy('title')
          .limit(documentLimit)
          .get()
          .then(
        (value) {
          itemsData.addAll(
            value.docs.map(
              (e) => ItemsModel.fromJson(
                e.data(),
              ),
            ),
          );
          isLoading = false;

          update();

          lastDocument = value.docs.last;

          if (value.docs.length < documentLimit) {
            hasMoreData = false;
          }
        },
      );
    } else {
      isLoadingData.value = true;
      await _firestore
          .collection('categories')
          .doc(categoryId)
          .collection(categoryTitle)
          .orderBy('title')
          .startAfterDocument(lastDocument!)
          .limit(documentLimit)
          .get()
          .then((value) {
        itemsData.addAll(
          value.docs.map(
            (e) => ItemsModel.fromJson(
              e.data(),
            ),
          ),
        );
        isLoadingData.value = false;

        update();

        lastDocument = value.docs.last;

        if (value.docs.length < documentLimit) {
          hasMoreData = false;
        }
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double currentPosition = scrollController.position.pixels;
      double height20 = Get.size.height * 0.20;

      if (maxScrollExtent - currentPosition <= height20) {
        getPaginedData();
      }
    });
  }
}
