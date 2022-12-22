import 'dart:ui';
import 'package:depay_v2/splash/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddWalletContainer extends StatelessWidget {
  const AddWalletContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.70;
    double contHeight = size.height * 0.2;
    return Padding(
      padding: EdgeInsets.all(30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          
          width: contWidth,
          height: contHeight,
          child: Stack(children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15.0,
                sigmaY: 15.0,
              ),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/icons/Plus.png",
                      height: 70,
                      color: const Color.fromARGB(169, 244, 246, 249),
                    ),
                    Text(
                      "Cüzdan Bağlayın",
                      style: GoogleFonts.ibmPlexMono(
                        color: const Color.fromARGB(169, 244, 246, 249),
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.07,
              child: Image.asset(
                "lib/assets/images/noise.jpg",
                width: MediaQuery.of(context).size.width * contWidth,
                height: MediaQuery.of(context).size.height * contHeight,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 30,
                    spreadRadius: 2,
                  )
                ],
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: Colors.white.withOpacity(0.2), width: 1.8),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.10),
                    Colors.white.withOpacity(0.25),
                  ],
                  stops: const [0.1, 1.0],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
