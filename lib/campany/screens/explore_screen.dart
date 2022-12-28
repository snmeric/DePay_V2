import 'package:depay_v2/assets/const.dart';
import 'package:flutter/material.dart';
import 'package:depay_v2/campany/constants.dart';
import 'package:depay_v2/campany/widgets/custom_list_litle.dart';

import '../widgets/appbar_images.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: bgSecondaryColor,
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Explore',style: regular15WhiteBoldText,),
                centerTitle: true,
                background: AppbarImages(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return CustomListTile(
                    collection: nftCollection[index],
                  );
                },
                childCount: nftCollection.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
