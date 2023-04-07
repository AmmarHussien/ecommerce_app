import 'package:ecommerce_app/adrresss/address_controller_screen.dart';
import 'package:ecommerce_app/cart/cart_controller_screen.dart';
import 'package:get/get.dart';

class ConfirmationControllerScreen extends GetxController {
  final addressControllerScreen = Get.find<AddressControllerScreen>();

  final cartControllerScreen = Get.find<CartControllerScreen>();

  String name = '';
  String address = '';
  String pincode = '';
  int totalPrice = 0;
  int payablePrice = 0;
  int totalDiscount = 0;

  void initializeData() {
    name = addressControllerScreen.name;
    address = addressControllerScreen.address;
    pincode = addressControllerScreen.pincode;

    totalPrice = cartControllerScreen.totalPrice;
    payablePrice = cartControllerScreen.totalSeeilgPrice;
    totalDiscount = cartControllerScreen.totalDiscount;
  }

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }
}
