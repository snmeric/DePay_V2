import 'package:depay_v2/assets/const.dart';
import 'package:depay_v2/assets/constants.dart';
import 'package:depay_v2/coin/coin_constants.dart';
import 'package:depay_v2/coin/widgets/background.dart';
import 'package:depay_v2/coin/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/coin.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({required this.coin, Key? key}) : super(key: key);
  Coin coin;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // Format values like this => 100,000,000
  final formatter = NumberFormat.decimalPattern();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.coin.name!,
          style: regular15WhiteBoldText,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${formatter.format(widget.coin.currentPrice)}',
                        style: big23WhiteText),
                    SizedBox(
                      height: 40,
                      width: 80,
                      child: Card(
                        color:
                            widget.coin.priceChangePercentage7DInCurrency! <= 0
                                ? kRedColor
                                : kGreenColor,
                        child: Center(
                          child: Text(
                            '${widget.coin.priceChangePercentage7DInCurrency!.toStringAsFixed(3)}%',
                            style: regular13WhiteText,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Chart(
                  isDetailScreen: true,
                  data: widget.coin,
                  blurRadius: 50,
                  spreadRadius: -10,
                  opacity: 0.05,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(widget.coin.image!),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        '${widget.coin.name!} (${widget.coin.symbol!.toUpperCase()})',
                        style: big23WhiteText)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 330,
                  height: 190,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(.1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Market Cap: \$${formatter.format(widget.coin.marketCap)}',
                            style: regular15WhiteText,
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 20,
                          ),
                          Text(
                            'Market Cap Sıralaması: ${widget.coin.marketCapRank}',
                            style: regular15WhiteText,
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 20,
                          ),
                          Text(
                            '24h En Yüksek : \$${formatter.format(widget.coin.high24H)}',
                            style: regular15WhiteText,
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 20,
                          ),
                          Text(
                            '24h En Düşük : \$${formatter.format(widget.coin.low24H)}',
                            style: regular15WhiteText,
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
