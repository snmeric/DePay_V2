import 'package:depay_v2/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';



class LoginController extends GetxController {
  final TextEditingController tokenIdEditController = TextEditingController();
  var box = GetStorage();
  bool isConnectWallet = false;
  String publicWalletAddress = "";
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    
  }

  @override
  void onClose() {
    super.onClose();
  }



 
}
