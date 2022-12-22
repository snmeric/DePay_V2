import 'package:depay_v2/assets/const.dart';
import 'package:eip55/eip55.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';
import 'package:web3dart/web3dart.dart';


import 'splash_controller.dart';



class SplashPage extends GetView<SplashController> {
   const SplashPage({Key? key}) : super(key: key);


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Image.asset('lib/assets/images/logo/logoGreen.png',height: 30.h,)
      ),
    );
  }
}