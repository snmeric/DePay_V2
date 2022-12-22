import 'package:card_swiper/card_swiper.dart';
import 'package:depay_v2/app_pages.dart';
import 'package:depay_v2/home/home_comp/balance_card.dart';
import 'package:depay_v2/home/home_controller.dart';
import 'package:depay_v2/splash/login_screen.dart';
import 'package:depay_v2/splash/splash_controller.dart';
import 'package:depay_v2/splash/util/wallet_add_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardSwipe extends StatelessWidget {
  const CardSwipe({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController c = Get.find();
    final HomeController d = Get.find();

    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 28.h,
            child: Swiper(
                viewportFraction: 0.8,
                scale: 0.6,
                itemWidth: 85.w,
                itemHeight: 27.h,
                pagination: const SwiperPagination(
                    margin: EdgeInsets.all(2.0),
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.white, color: Colors.grey)),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                     BalanceCard(),
                     
                    ],
                  );
                },
                itemCount: 2),
          ),
        ),
      ],
    );
  }
}
