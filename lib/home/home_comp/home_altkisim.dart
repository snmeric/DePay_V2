import 'package:depay_v2/assets/const.dart';
import 'package:depay_v2/assets/constants.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePart extends StatelessWidget {
 

  HomePart({
    Key? key,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.60;
    double contHeight = size.height * 0.3;
    var f = NumberFormat('###.##', 'en_US');

    return Padding(
      padding: const EdgeInsets.all(28),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            Get.to(() => Container());
          },
          child: SizedBox(
            height: 14.h,
           
            child: Container(
              color: bgSecondaryColor,
              child: Stack(children: [
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                        Column(
                            children: [
                                SizedBox(height: 6.h, child: 
                              Image.asset('lib/assets/icons/Discount.png',fit:BoxFit.cover,),),
                              Text('İşlemler',style: minTextStyle,)
                            ],
                          ),
                          Column(
                            children: [
                                SizedBox(height: 6.h, child: 
                              Image.asset('lib/assets/icons/Document.png',fit:BoxFit.cover,),),
                              Text("NFT'lerim",style: minTextStyle,)
                            ],
                          ),
                          Column(
                            children: [
                                SizedBox(height: 6.h, child: 
                              Image.asset('lib/assets/icons/Activity.png',fit:BoxFit.cover,),),
                              Text('Coinlerim',style: minTextStyle,)
                            ],
                          ),
                         
                         
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
