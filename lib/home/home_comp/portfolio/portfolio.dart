import 'package:depay_v2/assets/constants.dart';
import 'package:depay_v2/coin/coin_constants.dart';
import 'package:depay_v2/coin/detail_screen.dart';
import 'package:depay_v2/coin/services/coin_service.dart';
import 'package:depay_v2/coin/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../assets/const.dart';
import '../../../coin/models/coin.dart';

class Portfolio extends StatefulWidget {
  Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  late Future<List<Coin>> _future;

  @override
  void initState() {
    _future = fetchData();
    super.initState();
  }

  final spinkit = const SpinKitThreeBounce(
    color: Colors.white,
    size: 20,
  );

  checkPercentage(data, int index) {
    return data[index]
            .priceChangePercentage7DInCurrency
            .toString()
            .contains('-')
        ? kRedColor
        : kGreenColor;
  }

  Widget build(BuildContext context) {
    // Format values like this => 100,000,000
    final formatter = NumberFormat.decimalPattern();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text('Portfolyo', style: regular15WhiteBoldText),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 160,
          child: FutureBuilder<List<Coin>>(
              future: _future,
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (snapshot.hasData) {
                  return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(width: 24),
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        data!.sort(
                          (b, a) => a.marketCap!.compareTo(b.marketCap!),
                        );
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Container(
                              width: 210,
                              height: 160,
                              color: bgSecondaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Stack(children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 18,
                                            backgroundImage: NetworkImage(
                                              data[index].image!,
                                            ),
                                            backgroundColor: Colors.transparent,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            //! Ending with "..." when Flutter Text exceeds a certain length.
                                            data[index].name!.length >= 13
                                                ? '${data[index].name!.substring(0, 13)}...'
                                                : data[index].name!,
                                            overflow: TextOverflow.fade,
                                            style: regular15WhiteBoldText,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Center(
                                          child: SizedBox(
                                              height: 65,
                                              width: 175,
                                              child: Chart(
                                                blurRadius: 250,
                                                spreadRadius: -10,
                                                data: data[index],
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                '\$${formatter.format(data[index].currentPrice)}',
                                                style: regular15WhiteText),
                                            Text(
                                                data[index]
                                                        .priceChangePercentage7DInCurrency
                                                        .toString()
                                                        .contains('-')
                                                    ? '${data[index].priceChangePercentage24H!.toStringAsFixed(2)}%'
                                                    : '+${data[index].priceChangePercentage24H!.toStringAsFixed(3)}%',
                                                style: TextStyle(
                                                  color: checkPercentage(
                                                      data, index),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ));
                      });
                } else if (snapshot.hasError) {
                  throw snapshot.error.toString();
                }
                return Center(child: spinkit);
              }),
        ),
      ],
    );
  }
}
