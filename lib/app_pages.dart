import 'package:depay_v2/assets/widgets/bottombar.dart';
import 'package:depay_v2/home/home_binding.dart';
import 'package:depay_v2/home/home_page.dart';

import 'package:depay_v2/splash/login_binding.dart';
import 'package:depay_v2/splash/login_screen.dart';
import 'package:depay_v2/splash/splash_binding.dart';
import 'package:depay_v2/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const NaviScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 2),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.LOGIN,
    //   page: () => const LoginScreen(),
    //   transition: Transition.fade,
    //   transitionDuration: const Duration(seconds: 2),
    //   binding: LoginBinding(),
    // ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 2),
      binding: SplashBinding(),
    ),
  ];
}

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
}
