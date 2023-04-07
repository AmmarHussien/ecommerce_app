import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/item_detail_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ItemDetailController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late ItemDetailModel modelDetail;
  bool isLoading = true;
  int discount = 0;
  bool isAlreadyAvalibale = false;

  Future<void> getItemDetails(
    String id,
  ) async {
    try {
      await _firestore.collection('products').doc(id).get().then((value) {
        modelDetail = ItemDetailModel.fromJson(value.data()!);
        discount = calculateDiscount(
          modelDetail.totalPrice,
          modelDetail.sellingPrice,
        );
        checkIfAllreadyInCart();
        isLoading = false;
        update();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> checkIfAllreadyInCart() async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .where('id', isEqualTo: modelDetail.id)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          isAlreadyAvalibale = true;
        }
        isLoading = false;
        update();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> addItemsToCart() async {
    isLoading = false;
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .doc(modelDetail.id)
          .set({
        'id': modelDetail.id,
      }).then((value) {
        checkIfAllreadyInCart();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  int calculateDiscount(int totalPrice, int sellPrice) {
    double discount = ((totalPrice - sellPrice) / totalPrice) * 100;
    return discount.toInt();
  }
}
