import 'package:depay_v2/app_pages.dart';
import 'package:depay_v2/home/home_controller.dart';
import 'package:depay_v2/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:sizer/sizer.dart';

main() async {
  await GetStorage.init();
  Get.put(SplashController());
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'DePay',
        initialRoute: AppPages.INITIAL,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,

        navigatorKey: Grock.navigationKey, // added line
        scaffoldMessengerKey: Grock.scaffoldMessengerKey, // added line
      );
    });
  }
}

