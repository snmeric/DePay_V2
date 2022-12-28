import 'dart:ui';
import 'package:depay_v2/assets/const.dart';
import 'package:depay_v2/home/home_controller.dart';
import 'package:depay_v2/splash/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddWalletContainer extends StatelessWidget {
  const AddWalletContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController d = Get.find();
    final Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.70;
    double contHeight = size.height * 0.2;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              // <-- SEE HERE

              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50.0),
              ),
            ),
            backgroundColor: bgColor,
            builder: (BuildContext context) {
              return SizedBox(
                height: 600,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_downward_rounded,
                            color: Colors.white,
                          )),
                      InkWell(
                        onTap: (() {
                          d.metaconnectWallet();
                        }),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: bgSecondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/assets/images/logo/MetaMask.png',
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Metamask ile giriş yap",
                                style: regular15WhiteBoldText,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          d.trustconnectWallet();
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: bgSecondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/assets/images/logo/TWT.png',
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Truswallet ile giriş yap",
                                style: regular15WhiteBoldText,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          d.rainbowconnectWallet();
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: bgSecondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/assets/images/logo/rainbow_logo.png',
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Rainbow ile giriş yap",
                                style: regular15WhiteBoldText,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              );
            });
        //d.connectWallet();
      },
      child: Padding(
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
      ),
    );
  }
}
