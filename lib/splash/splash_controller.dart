import 'dart:developer';

import 'package:depay_v2/app_pages.dart';
import 'package:depay_v2/assets/widgets/bottombar.dart';
import 'package:depay_v2/splash/login_controller.dart';
import 'package:depay_v2/splash/login_screen.dart';

import 'package:depay_v2/splash/model/app_info.dart';
import 'package:depay_v2/splash/wallet_connect_helper.dart';
import 'package:eip55/eip55.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:http/http.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';

class SplashController extends GetxController {
  // final box = GetStorage();
  // late WalletConnect connector;
  // Future createSession() async {
  //   // Create a new session
  //   if (!connector.connected) {
  //     final session = await connector.createSession(
  //       chainId: 4160,
  //     );

  //     print('Connected: $session');
  //   }
  // }

  // final String ethRinkebyTestnetEndpoints =
  //     'https://goerli.infura.io/v3/37003bef491d4f7c8bac9c3c0d3ad7e8';

  // final WalletConnectHelper walletConnectHelper = WalletConnectHelper(
  //   appInfo: AppInfo(
  //     name: "DePay",
  //     url: "https://example.mobile.com",
  //   ),
  // );

  // late Web3Client web3client;
  // final TextEditingController fromAddressEditController =
  //     TextEditingController();
  // final TextEditingController toAddressEditController = TextEditingController();
  // final TextEditingController tokenIdEditController = TextEditingController();

  // var isConnectWallet = false.obs;
  // String publicWalletAddress = "";

  // void connectWallet() async {
  //   print(isConnectWallet.value);
  //   isConnectWallet.value = (await walletConnectHelper.initSession());
  //   if (isConnectWallet.value) {
  //     publicWalletAddress = walletConnectHelper
  //         .getEthereumCredentials()
  //         .getEthereumAddress()
  //         .toString();
  //     publicWalletAddress = toEIP55Address(publicWalletAddress);

  //     // Init
  //     initWeb3Client();

  //     print(isConnectWallet.value);
  //     fromAddressEditController.text = publicWalletAddress;
  //     toAddressEditController.text =
  //         '0x3D7BAD4D04eE46280E29B5149EE1EAa0d5Ff649F';

  //     // Update ui

  //   }
  // }

  // void disconnectWallet() {
  //   walletConnectHelper.dispose();
  //   isConnectWallet.value = false;
  //   publicWalletAddress = '';
  //   tokenIdEditController.text = '';
  //   print(isConnectWallet);
  //   Grock.snackBar(
  //       title: 'Oturum Kapatıldı', description: 'Oturum Başarıyla Kapatıldı.');
  // }

  // void initWeb3Client() async {
  //   web3client = Web3Client(ethRinkebyTestnetEndpoints, Client());
  //   await getRouteName();
  //   print(isConnectWallet.value);
  // }

  // Future<void> getRouteName() async {
  //   isConnectWallet.value ? Get.to(const NaviScreen()) : Get.to(const LoginScreen());
  // }

// !isConnectWallet ? _buildDisconnectedView() : _buildConnectedView(),
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
