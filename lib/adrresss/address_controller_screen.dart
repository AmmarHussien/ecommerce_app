import 'package:ecommerce_app/shared/alert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressControllerScreen extends GetxController {
  late SharedPreferences _preferences;
  String name = "", address = "", pincode = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  bool isAddressAvailable = false;

  Future<void> getInstance() async {
    _preferences = await SharedPreferences.getInstance();

    String address = getString('address');

    if (address.isNotEmpty) {
      isAddressAvailable = true;
    } else {
      isAddressAvailable = false;
    }

    initilizeInfo();

    update();
  }

  void onTap() async {
    _preferences = await SharedPreferences.getInstance();
    if (nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        pincodeController.text.isNotEmpty) {
      if (kDebugMode) {
        print(nameController.text);
         print(addressController.text);
      print(pincodeController.text);
      }
     
      await saveString(
        'name',
        nameController.text,
      );
      await saveString(
        'address',
        addressController.text,
      );
      await saveString(
        'pincode',
        pincodeController.text,
      );
     

      getInstance();
    } else {
      showAlert("All fields are required");
    }
  }

  void onEdit() async {
    isAddressAvailable = false;
    update();

    await _preferences.clear();
  }

  Future<void> saveString(String key, String value) async {
   
    await _preferences.setString(
      key,
      value,
    );
  }

  String getString(String key) => _preferences.getString(key) ?? "";

  void initilizeInfo() {
    name = getString('name');
    address = getString('address');
    pincode = getString('pincode');
  }

  @override
  void onInit() async {
    super.onInit();
    getInstance();
  }
}
