import 'package:depay_v2/app_pages.dart';
import 'package:depay_v2/assets/const.dart';
import 'package:depay_v2/home/home_controller.dart';

import 'package:depay_v2/profile/profile_controller.dart';
import 'package:depay_v2/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //* loading Animation
  final spinkit = const SpinKitThreeBounce(
    color: Colors.white,
    size: 20,
  );

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.find();

    return Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: TextButton(
              onPressed: () {
                // setState(() {
                //   //  c.isLoading = true;
                // });

                c.disconnectWallet();
                c.session.value = WalletConnectSession(accounts: []);
                Grock.snackBar(
                    title: "Oturum Kapatıldı",
                    description: "Cüzdan Başarıyla Kaldırıldı..");
                Get.offAllNamed(Routes.HOME);

                // setState(() {
                //   //  c.isLoading = false;
                // });
              },
              child: Text('Çıkış yap')),
        ));
  }
}
