import 'dart:ui';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:sizer/sizer.dart';

class BalanceBackground extends StatelessWidget {
  const BalanceBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipSmoothRect(
        radius: SmoothBorderRadius(
          cornerRadius: 34,
          cornerSmoothing: 1,
        ),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 4),
                spreadRadius: -1,
                blurRadius: 18,
                color: Color.fromRGBO(255, 86, 0, 1),
              ),
            ],
          ),
          padding: const EdgeInsets.all(1),
          // decoration: ShapeDecoration(
          //   //color: Colors.red.withOpacity(0.75),
          //   shape: SmoothRectangleBorder(
          //     borderRadius: SmoothBorderRadius(
          //       cornerRadius: 34,
          //       cornerSmoothing: 1,
          //     ),
          //   ),
          //   gradient: const LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     stops: [0, 0.25, 0.75, 1],
          //     colors: [
          //       Color(0x99FFFFFF),
          //       Color(0x00FFFFFF),
          //       Color(0x00FFFFFF),
          //       Color(0x99FFFFFF),
          //     ],
          //   ),
          // ),

          child: Stack(children: [
            ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.08), BlendMode.darken),
                child: Image.asset(
                  'lib/assets/images/mesh-551.png',
                  fit: BoxFit.cover,
                ))
            // BackdropFilter(
            //   filter: ImageFilter.blur(
            //     sigmaX: 15.0,
            //     sigmaY: 15.0,
            //   ),
            //   child: Opacity(
            //     opacity: 0.07,
            //   ),
            // ),
            // ClipSmoothRect(
            //   radius: SmoothBorderRadius(
            //     cornerRadius: 34,
            //     cornerSmoothing: 1,
            //   ),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withOpacity(0.12),
            //           blurRadius: 30.h,
            //           spreadRadius: 2,
            //         ),
            //       ],
            //       borderRadius: BorderRadius.circular(34),
            //       border: Border.all(
            //           color: Colors.white.withOpacity(0.1), width: 1.8),
            //       gradient: LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //         colors: [
            //           Colors.white.withOpacity(0.05),
            //           Colors.white.withOpacity(0.20),
            //         ],
            //         stops: const [0.1, 1.0],
            //       ),
            //     ),
            //   ),
            // ),
          ]),
        ));
  }
}
