import 'package:flutter/material.dart';
import 'package:depay_v2/campany/constants.dart';

import '../models.dart';

class ListImage extends StatelessWidget {
  final NFT nft;
  const ListImage({super.key, required this.nft});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushBidScreen(context, nft),
      child: Hero(
        tag: nft.price,
        child: Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: radius10,
            child: Image(
              image: AssetImage(nft.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
