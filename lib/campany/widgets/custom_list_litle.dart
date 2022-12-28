import 'package:flutter/material.dart';
import 'package:depay_v2/campany/constants.dart';
import 'package:depay_v2/campany/models.dart';

class CustomListTile extends StatelessWidget {
  final NFTCollection collection;
  const CustomListTile({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushNFTScreen(context, collection),
      child: Container(
        
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: roundWhite,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: radius10,
              child: Image(
                image: AssetImage(collection.cover),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  collection.name,
                  style: mediumTextStyle.copyWith(color: Colors.white),
                ),
                Text(
                  collection.by,
                  style: smallTextStyle.copyWith(color: Colors.white),
                )
              ],
            ),
            const Spacer(),
            Text(
              '${collection.floorPrice.toString().padRight(4, '0')} ETH',
              style: mediumTextStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
