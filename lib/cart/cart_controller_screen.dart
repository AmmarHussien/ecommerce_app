import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/item_detail_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CartControllerScreen extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List productIds = [];
  List<ItemDetailModel> productsDetails = [];

  bool isLoading = true;

  int totalPrice = 0;
  int totalDiscount = 0;
  int totalSeeilgPrice = 0;

  Future<void> getCartItem() async {
    productsDetails = [];
    productIds = [];
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .get()
          .then((value) {
        productIds = value.docs
            .map(
              (e) => e.data()['id'],
            )
            .toList();

        getProductDetails();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getProductDetails() async {
    for (var item in productIds) {
      try {
        await _firestore.collection('products').doc(item).get().then(
          (value) {
            productsDetails.add(
              ItemDetailModel.fromJson(
                value.data()!,
              ),
            );
          },
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    calculatePrice();
    isLoading = false;
    update();
  }

  int calculateDiscount(
    int totalPrice,
    int sellPrice,
  ) {
    double discount = ((totalPrice - sellPrice) / totalPrice) * 100;
    return discount.toInt();
  }

  void calculatePrice() {
    for (var item in productsDetails) {
      totalPrice = totalPrice + item.totalPrice;
      totalSeeilgPrice = totalSeeilgPrice + item.sellingPrice;
    }

    totalDiscount = totalPrice - totalSeeilgPrice;
  }

  Future<void> removeFromCart(String id) async {
    isLoading = true;
    update();
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .doc(id)
          .delete()
          .then((value) {
        getCartItem();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void onInit() {
    getCartItem();
    super.onInit();
  }
}
