import 'package:depay_v2/assets/const.dart';
import 'package:flutter/material.dart';
import 'package:depay_v2/campany/constants.dart';

import '../widgets/rotated_listview.dart';
import '../widgets/slide_to_continue.dart';

class CampanyHomePage extends StatelessWidget {
  const CampanyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          RotatedListview(nft: nftCollection[0].nft?.sublist(0, 5)),
          RotatedListview(nft: nftCollection[1].nft?.sublist(0, 4)),
          RotatedListview(nft: nftCollection[2].nft?.sublist(0, 5)),
          RotatedListview(nft: nftCollection[3].nft?.sublist(0, 4)),
          SizedBox(height: 50,),
          SizedBox(
            width: 250,
            child: Text(
              'NFT Koleksiyonunu Keşfet',
              textAlign: TextAlign.center,
              style: regular15WhiteBoldText
            ),
          ),
          const SizedBox(height: 15),
         
          SlideToContinue(
            backgroundColor: bgSecondaryColor,
            foregroundColor: kWhiteColor,
            text: 'Keşfet',
            onConfirm: () => pushExploreScreen(context),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
