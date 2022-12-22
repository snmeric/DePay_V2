// import 'package:depay_v2/home/home_controller.dart';
// import 'package:depay_v2/splash/splash_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final HomeController c = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         const SizedBox(height: 16.0),
//         TextButton(
//           onPressed: () {
//             c.walletConnectHelper.initSession();
            
//           },
//           child: const Text(
//             'Connect',
//             style: TextStyle(fontSize: 30.0),
//           ),
//         ),
//       ]),
//     );
//   }
// }
