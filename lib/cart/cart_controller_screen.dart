import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/item_detail_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartControllerScreen extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List productIds = [];
  List<ItemDetailModel> productsDetails = [];

  bool isLoading = true;

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
      print(e);
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
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  int calculateDiscount(int totalPrice, int sellPrice) {
    double discount = ((totalPrice - sellPrice) / totalPrice) * 100;
    return discount.toInt();
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
    } catch (e) {}
  }

  @override
  void onInit() {
    getCartItem();
    super.onInit();
  }
}
