import 'dart:ui';
import 'package:depay_v2/assets/const.dart';
import 'package:depay_v2/assets/constants.dart';
import 'package:depay_v2/coin/widgets/chart.dart';
import 'package:depay_v2/coin/widgets/background.dart';
import 'package:depay_v2/coin/detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coin_constants.dart';
import './models/coin.dart';
import './services/coin_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Piyasa extends StatefulWidget {
  const Piyasa({Key? key}) : super(key: key);

  @override
  State<Piyasa> createState() => _PiyasaState();
}

class _PiyasaState extends State<Piyasa> {
  late Future<List<Coin>> _future;
  @override
  void initState() {
    _future = fetchData();
    super.initState();
  }

  //* loading Animation
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

  Map sortBy = {
    'Fiyata Göre': false,
    'Ada Göre': false,
    "Market Cap'a Göre": false,
  };
  void sortData(
    List<Coin> data,
  ) {
    if (sortBy.values.elementAt(0)) {
      // if sort by Price == true
      data.sort(
        (b, a) => a.currentPrice!.compareTo(b.currentPrice!),
      );
    } else if (sortBy.values.elementAt(1)) {
      // if sort by Name == true
      data.sort(
        (a, b) => a.name!.compareTo(b.name!),
      );
    } else if (sortBy.values.elementAt(2)) {
      // if sort by Market Cap == true
      data.sort(
        (b, a) => a.marketCap!.compareTo(b.marketCap!),
      );
    }
  }

  void showCustomDialog() {
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.all(20),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor:bgSecondaryColor,
              title: Text('Sırala:', style: regular15WhiteBoldText),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(3, (index) {
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        sortBy.updateAll(
                            (key, value) => false); // Set all values ​​to false
                        sortBy.update(
                            sortBy.keys.elementAt(index),
                            (value) =>
                                value = true); // Set selected values ​​to true
                      });
                      Navigator.pop(context);
                    },
                    child: Text(sortBy.keys.elementAt(index),
                        style: regular15WhiteText),
                  );
                }),
              ),
            ),
          );
        });
  }

  // Format values like this => 100,000,000
  final formatter = NumberFormat.decimalPattern();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        // appBar: PreferredSize(
        //   preferredSize: const Size(double.infinity, 60),
        //   child: ClipRRect(
        //     child: BackdropFilter(
        //       filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        //       child: AppBar(
        //         backgroundColor: Colors.transparent,
        //         title: Text(
        //           'Discover',
        //           style: regular18WhiteText,
        //         ),
        //         centerTitle: true,
        //         actions: [
        //           IconButton(
        //               onPressed: () {
        //                 showCustomDialog();
        //               },
        //               icon: const Icon(
        //                 Icons.sort,
        //                 color: Colors.white,
        //               ))
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, __) => [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    actions: [
                      IconButton(
                          onPressed: () {
                            showCustomDialog();
                          },
                          icon: const Icon(
                            Icons.sort,
                            color: Colors.white,
                          ))
                    ],
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      'Piyasa',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    snap: true,
                    floating: true,
                  )
                ],
            body: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(color: bgSecondaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<List<Coin>>(
                    future: _future,
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              sortData(data);
                              return Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 110, top: 20),
                                    child: Center(
                                      child: SizedBox(
                                          height: 30,
                                          width: 60,
                                          child: Chart(
                                            blurRadius: 30,
                                            spreadRadius: -10,
                                            data: data[index],
                                          )),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                        //! Ending with "..." when Flutter Text exceeds a certain length.
                                        data[index].name!.length >= 13
                                            ? '${data[index].name!.substring(0, 13)}...'
                                            : data[index].name!,
                                        overflow: TextOverflow.fade,
                                        style: regular15WhiteText),
                                    leading: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                        data[index].image!,
                                      ),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    trailing: Column(
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
                                                ? '${data[index].priceChangePercentage7DInCurrency!.toStringAsFixed(2)}%'
                                                : '+${data[index].priceChangePercentage7DInCurrency!.toStringAsFixed(3)}%',
                                            style: TextStyle(
                                              color:
                                                  checkPercentage(data, index),
                                            ))
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    coin: data[index],
                                                  )));
                                    },
                                    tileColor: Colors.transparent,
                                    subtitle: Text(
                                        data[index].symbol!.toUpperCase(),
                                        style: regular13GreyText),
                                  ),
                                ],
                              );
                            });
                      } else if (snapshot.hasError) {
                        throw snapshot.error.toString();
                      }
                      return Center(child: spinkit);
                    },
                  ),
                ),
              ),
            )));
  }
}
