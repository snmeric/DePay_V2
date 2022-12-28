import 'package:depay_v2/assets/const.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:depay_v2/campany/constants.dart';
import 'package:depay_v2/campany/models.dart';
import 'package:depay_v2/campany/widgets/slide_to_continue.dart';

class BidScreen extends StatefulWidget {
  final NFT nft;
  const BidScreen({super.key, required this.nft});

  @override
  State<BidScreen> createState() => _BidScreenState();
}

class _BidScreenState extends State<BidScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1), () {
        showModal(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.nft.price,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.nft.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: kTransparent,
            appBar: AppBar(
              toolbarHeight: 90,
              backgroundColor: kTransparent,
              elevation: 0,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: radius100,
                    color: kWhiteColor,
                  ),
                  child: const Icon(Icons.arrow_back_ios_rounded,
                      color: kBlackColor),
                ),
              ),
             
            ),
          ),
        ),
      ),
    );
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kTransparent,
        barrierColor: kTransparent,
        enableDrag: false,
        context: context,
        transitionAnimationController: AnimationController(
          vsync: this,
          duration: const Duration(seconds: 1),
          reverseDuration: const Duration(milliseconds: 1),
        ),
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              Navigator.pop(context);
              Navigator.pop(context);
              return true;
            },
            child: GlassmorphicContainer(
              width: double.infinity,
              height: 200,
              borderRadius: 0,
              linearGradient: linearGradient,
              border: 0,
              blur: 5,
              borderGradient: borderLinearGradient,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //const Spacer(),
                    Text(
                      '${widget.nft.price.toString().padRight(4, '0')} ETH',
                      style: big23BlackText,
                    ),
                    const SizedBox(height: 10),
                    SlideToContinue(
                      backgroundColor: kBlackColor,
                      foregroundColor: kWhiteColor,
                      text: 'Şimdi Satın Al',
                      onConfirm: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
