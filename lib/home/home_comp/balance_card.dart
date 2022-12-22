import 'package:depay_v2/app_pages.dart';
import 'package:depay_v2/assets/const.dart';
import 'package:depay_v2/home/home_comp/balance_ground.dart';
import 'package:depay_v2/home/home_controller.dart';
import 'package:depay_v2/splash/login_screen.dart';
import 'package:depay_v2/splash/splash_controller.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../assets/constants.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget balanceText() {
   
    final HomeController d = Get.find();

    //c.walletAdress();

    return Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ignore: unnecessary_null_comparison

              
              Obx(() => Text(
                    "${d.session.value.accounts.first}",
                    style: GoogleFonts.ibmPlexMono(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  )),
                  IconButton(
                  onPressed: () {
                    d.disconnectWallet();
                  },
                  icon: Icon(Icons.delete,color: Colors.white,),
                  ),
            ])
        // : Text(
        //     'Cüzdan Yok',
        //     style: GoogleFonts.ibmPlexMono(
        //       color: Colors.white,
        //       fontWeight: FontWeight.w400,
        //       fontSize: 16,
        //     ),
        //   ))
        );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          const BalanceBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      "lib/assets/images/logo/MetaMask.png",
                      height: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "lib/assets/images/logo/MetaMask.png",
                      height: 80,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("ETH AĞI",
                          style: GoogleFonts.ibmPlexMono(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 19,
                          )),
                    ),
                  )
                ],
              ),
            ],
          ),
          balanceText(),
        ],
      ),
    );
  }
}
