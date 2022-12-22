import 'package:depay_v2/assets/animation_ground.dart';
import 'package:depay_v2/assets/const.dart';
import 'package:depay_v2/assets/widgets/appbar.dart';
import 'package:depay_v2/home/home_comp/card_swipe.dart';
import 'package:depay_v2/home/home_comp/home_altkisim.dart';
import 'package:depay_v2/home/home_comp/portfolio/portfolio.dart';
import 'package:depay_v2/home/home_controller.dart';
import 'package:depay_v2/splash/model/app_info.dart';
import 'package:depay_v2/splash/splash_controller.dart';
import 'package:depay_v2/splash/util/wallet_add_card.dart';
import 'package:depay_v2/splash/wallet_connect_helper.dart';
import 'package:eip55/eip55.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';
import 'package:web3dart/web3dart.dart';

import '../splash/model/crypto_wallet.dart';
import '../splash/wallect_connect/wallet_connect_ethereum_credentials.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isAppBar = true;
  final ScrollController _scroolController = ScrollController();
  final _controller = PageController();
  final _offsetToArmed = 120.0;
  var coinlerList = [];
  @override
  RxList cryptoCharts = [].obs;

  String periodID = '1DAY';
  void initControllers() {
    // Get.put(LoginController());
    Get.put(HomeController());
  }

  DateFormat format = DateFormat('yyyy-MM-dd HH:MM');
  void forceBalanceToRefresh() {
    setState(() {
      cryptoCharts = cryptoCharts;
    });
  }

/*WALLET CONNECT */

  /// get nft-contract name
  // Future<void> getContractName() async {
  //   String? name = await contract.name();
  //   Fluttertoast.showToast(msg: name!);
  // }

  /// get nft-contract owner address
  // Future<void> getContractOwnerAddress() async {
  //   EthereumAddress ownerAddress = await contract.owner();
  //   Fluttertoast.showToast(msg: "$ownerAddress");
  // }

  /// transfer nft to specific user
  // Future<void> transferNFT() async {
  //   try {
  //     // check input value string
  //     String fromString = fromAddressEditController.text;
  //     String toString = toAddressEditController.text;
  //     String tokenIdString = tokenIdEditController.text;
  //     if (fromString.isEmpty || toString.isEmpty) {
  //       Fluttertoast.showToast(msg: 'Please input address');
  //       return;
  //     } else if (tokenIdString.isEmpty) {
  //       Fluttertoast.showToast(msg: 'Please input tokenId');
  //       return;
  //     }

  //     // covert to correct type
  //     EthereumAddress fromAddress = EthereumAddress.fromHex(fromString);
  //     EthereumAddress toAddress = EthereumAddress.fromHex(toString);
  //     int tokenId = int.parse(tokenIdString);

  //     // help users navigating to Metamask app for pressing button
  //     await launchUrlString(CryptoWallet.metamask.universalLink);

  //     // transfer
  //     final WalletConnectEthereumCredentials credentials = walletConnectHelper.getEthereumCredentials();
  //     try {
  //       final String transferResult = await contract.safeTransferFrom(
  //         fromAddress,
  //         toAddress,
  //         BigInt.from(tokenId),
  //         credentials: credentials,
  //         transaction: Transaction(
  //           from: fromAddress,
  //           to: toAddress,
  //         ),
  //       );
  //       Fluttertoast.showToast(msg: 'Transfer successfully\n$transferResult');
  //     } catch (e) {
  //       Fluttertoast.showToast(msg: 'Transfer failed - $e');
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: "transferNFT() - failure - $e");
  //   }
  // }

  final HomeController d = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: bgColor,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: MyGlassAppbar(),
        ),
        body: _buildConnectedView(),
      ),
    );
  }

  Widget _buildConnectedView() {
    @override

        //     //SmoothPageIndıcator
        //     final _controller = PageController();
        // int cryptoindex = 0;
        final Size size = MediaQuery.of(context).size;
    // double contWidth = size.width * 0.70;
    // double contHeight = size.height * 0.25;

    return Scaffold(
        //backgroundColor: Colors.red,
        extendBodyBehindAppBar: true,
        backgroundColor: bgColor,

// actions: [
//             if (isConnectWallet)
//               IconButton(
//                 icon: const Icon(Icons.exit_to_app_rounded),
//                 onPressed: () => disconnectWallet(),
//               ),
//           ],
        //Appbar

        //BODY

        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  //BackgroundsCustomPaint(),
                  AniBackground(),

                  Obx(() => Column(
                        //clipBehavior: Clip.none,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          d.session.value.accounts.length == 0
                              ? InkWell(
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
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .arrow_downward_rounded,
                                                        color: Colors.white,
                                                      )),
                                                  InkWell(
                                                    onTap: (() {
                                                      d.metaconnectWallet();
                                                      
                                                    }),
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      padding:
                                                          EdgeInsets.all(25),
                                                      decoration: BoxDecoration(
                                                        color: bgSecondaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      height: 80,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
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
                                                            style:
                                                                regular15WhiteBoldText,
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
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      decoration: BoxDecoration(
                                                        color: bgSecondaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      height: 80,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
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
                                                            style:
                                                                regular15WhiteBoldText,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(5),
                                                    padding: EdgeInsets.all(25),
                                                    decoration: BoxDecoration(
                                                      color: bgSecondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    height: 80,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
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
                                                          style:
                                                              regular15WhiteBoldText,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                          );
                                        });
                                    //d.connectWallet();
                                  },
                                  child: AddWalletContainer())
                              : CardSwipe(),

                          Portfolio(),

                          //COINLER

                          HomePart()
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }

  // Widget _buildDisconnectedView() {
  //   return Center(
  //     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //       TextButton(
  //         onPressed: () {
  //           d.connectWallet();
  //         },
  //         child: const Text(
  //           'Connect',
  //           style: TextStyle(fontSize: 30.0),
  //         ),
  //       ),
  //     ]),
  //   );
  // }
}
