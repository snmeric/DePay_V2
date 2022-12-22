import 'dart:async';

import 'package:depay_v2/home/home_controller.dart';
import 'package:depay_v2/splash/util/deeplink_util.dart';
import 'package:eip55/eip55.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';
import 'model/app_info.dart';
import 'model/crypto_wallet.dart';
import 'wallect_connect/wallet_connect_ethereum_credentials.dart';

/// WalletConnectHelper is an object for implement WalletConnect protocol for
/// mobile apps using deep linking to connect with wallets.
class WalletConnectHelper {
  static const String ethRinkebyTestnetEndpoints =
      'https://goerli.infura.io/v3/45e42f4dc9244dd7b11e113a7f092a26';

  final String? bridge;

  /// mobile app info
  final AppInfo appInfo;

  late WalletConnect connector;

  SessionStatus? sessionStatus;
  List<String> accounts = [];

  /// Connector using brigde 'https://bridge.walletconnect.org' by default.
  WalletConnectHelper({
    this.bridge,
    required this.appInfo,
  }) {
    getWalletConnect().then((value) => connector = value);
  }

  Future<WalletConnect> getWalletConnect() async {
   
    final sessionStorage = WalletConnectSecureStorage();
    final session = await sessionStorage.getSession();

    final WalletConnect connector = WalletConnect(
      bridge: bridge ?? 'https://bridge.walletconnect.org',
      session: session,
      sessionStorage: sessionStorage,
      clientMeta: PeerMeta(
        name: appInfo.name ?? 'WalletConnect',
        description: appInfo.description ?? 'WalletConnect Developer App',
        url: appInfo.url ?? 'https://walletconnect.org',
        icons: appInfo.icons ??
            [
              'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
            ],
      ),
    );
    return connector;
  }

  //----------------------------------------------------------------

  void reset() async {
    connector = await getWalletConnect();
  }

  Future<bool> metainitSession({int? chainId}) async {
    if (!connector.connected) {
      try {
        sessionStatus = await connector.createSession(
          chainId: chainId,
          onDisplayUri: (uri) async {
            await _metaConnectWallet(displayUri: uri);
          },
        );

        accounts = sessionStatus?.accounts ?? [];

        return true;
      } catch (e) {
        debugPrint('createSession() - failure - $e');
        //reset();
        return false;
      }
    } else {
      return true;
    }
  }
    Future<bool> trustinitSession({int? chainId}) async {
    if (!connector.connected) {
      try {
        sessionStatus = await connector.createSession(
          chainId: chainId,
          onDisplayUri: (uri) async {
            await _trustwalletConnectWallet(displayUri: uri);
          },
        );

        accounts = sessionStatus?.accounts ?? [];

        return true;
      } catch (e) {
        debugPrint('createSession() - failure - $e');
        //reset();
        return false;
      }
    } else {
      return true;
    }
  }

  Future<void> _metaConnectWallet({
    CryptoWallet wallet = CryptoWallet.metamask,
    required String displayUri,
  }) async {
    var deeplink = DeeplinkUtil.getDeeplink(wallet: wallet, uri: displayUri);
    bool isLaunch = await launchUrlString(deeplink);
    if (!isLaunch) {
      throw 'connectWallet() - failure - Could not open $deeplink.';
    }
  }

   Future<void> _trustwalletConnectWallet({
    CryptoWallet wallet = CryptoWallet.trustWallet,
    required String displayUri,
  }) async {
    var deeplink = DeeplinkUtil.getDeeplink(wallet: wallet, uri: displayUri);
    bool isLaunch = await launchUrlString(deeplink);
    if (!isLaunch) {
      throw 'connectWallet() - failure - Could not open $deeplink.';
    }
  }

  Future<String> trustGetPublicAddress(
      {CryptoWallet wallet = CryptoWallet.trustWallet}) async {
    if (!connector.connected) {
      await trustinitSession();
    }

    if (accounts.isNotEmpty) {
      String address = accounts.first;
      address = toEIP55Address(address);
      return address;
    } else {
      throw 'Unexpected exception';
    }
  }
  Future<String> metaGetPublicAddress(
      {CryptoWallet wallet = CryptoWallet.metamask}) async {
    if (!connector.connected) {
      await metainitSession();
    }

    if (accounts.isNotEmpty) {
      String address = accounts.first;
      address = toEIP55Address(address);
      return address;
    } else {
      throw 'Unexpected exception';
    }
  }

  WalletConnectEthereumCredentials getEthereumCredentials() {
    EthereumWalletConnectProvider provider =
        EthereumWalletConnectProvider(connector);
    WalletConnectEthereumCredentials credentials =
        WalletConnectEthereumCredentials(provider: provider);
    return credentials;
  }

  Future<void> dispose() async {
    connector.session.reset();
    await connector.killSession();
    await connector.close();

    sessionStatus = null;
    accounts = [];

    reset();
  }
}


















// import 'dart:async';

// import 'package:eip55/eip55.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:grock/grock.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:walletconnect_dart/walletconnect_dart.dart';
// import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';

// import '../app_pages.dart';
// import '../splash/model/app_info.dart';
// import '../splash/model/crypto_wallet.dart';
// import '../splash/util/deeplink_util.dart';
// import '../splash/wallect_connect/wallet_connect_ethereum_credentials.dart';

// /// WalletConnectHelper is an object for implement WalletConnect protocol for
// /// mobile apps using deep linking to connect with wallets.
// class WalletConnectHelper {
//   var _account = ''.obs;
//   static const String ethRinkebyTestnetEndpoints =

//       'https://rinkeby.infura.io/v3/e3090e47c3624aa3aa126fa7297bff9b';

//   final String? bridge;
//   final box = GetStorage();

//   /// mobile app info
//   final AppInfo appInfo;

//   late WalletConnect connector;

//   SessionStatus? sessionStatus;
//   List<String> accounts = [];

//   /// Connector using brigde 'https://bridge.walletconnect.org' by default.
//   WalletConnectHelper({
//     this.bridge,
//     required this.appInfo,
//   }) {
//     getWalletConnect().then((value) => connector = value);
//   }

//   Future<WalletConnect> getWalletConnect() async {
//     // Define a session storage
//     final sessionStorage = WalletConnectSecureStorage();
//     final session = await sessionStorage.getSession();

//     final WalletConnect connector = WalletConnect(
//       bridge: bridge ?? 'https://bridge.walletconnect.org',
//       session: session,
//       sessionStorage: sessionStorage,
//       clientMeta: PeerMeta(
//         name: appInfo.name ?? 'WalletConnect',
//         description: appInfo.description ?? 'WalletConnect Developer App',
//         url: appInfo.url ?? 'https://walletconnect.org',
//         icons: appInfo.icons ??
//             [
//               'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
//             ],
//       ),
//     );

//     return connector;
//   }

//   //----------------------------------------------------------------

//   void reset() async {
//     connector = await getWalletConnect();
//   }

//   Future<bool> initSession({int? chainId}) async {
// // Define a session storage
//     final sessionStorage = WalletConnectSecureStorage();
//     final session = await sessionStorage.getSession();

//     if (!connector.connected) {
//       try {
//         sessionStatus = await connector.createSession(
//           chainId: chainId,
//           onDisplayUri: (uri) async {
//             await _connectWallet(displayUri: uri);
//           },
//         );
//         //Get.offAllNamed(Routes.HOME);
//         // session;
//         // sessionStorage;
//         // accounts = sessionStatus?.accounts ?? [];

//         _account.value = session?.accounts.first ?? '';
//         connector.registerListeners(onConnect: (status) {
//           _account.value = status.accounts[0];
//         });

//         return true;
//       } catch (e) {
//         debugPrint('createSession() - failure - $e');
//         reset();
//         return false;
//       }
//     } else {
//       Grock.snackBar(title: "Oturum Zaten Açık", description: "Oturum Açık");
//       return true;
//     }
//   }

//   Future<void> _connectWallet({
//     CryptoWallet wallet = CryptoWallet.metamask,
//     required String displayUri,
//   }) async {
//     var deeplink = DeeplinkUtil.getDeeplink(wallet: wallet, uri: displayUri);
//     bool isLaunch = await launchUrlString(deeplink);
//     if (!isLaunch) {
//       throw 'connectWallet() - failure - Could not open $deeplink.';
//     }
//   }

//   Future<String> getPublicAddress(
//       {CryptoWallet wallet = CryptoWallet.metamask}) async {
//     if (!connector.connected) {
//       final session = await connector.createSession(
//         chainId: 4160,
//       );

//       print('Connected: $session');
//     }

//     if (accounts.isNotEmpty) {
//       String address = accounts.first;
//       address = toEIP55Address(address);
//       return address;
//     } else {
//       throw 'Unexpected exception';
//     }
//   }

//   WalletConnectEthereumCredentials getEthereumCredentials() {
//     EthereumWalletConnectProvider provider =
//         EthereumWalletConnectProvider(connector);
//     WalletConnectEthereumCredentials credentials =
//         WalletConnectEthereumCredentials(provider: provider);
//     return credentials;
//   }

//   Future<void> dispose() async {
//     connector.session.reset();
//     await connector.killSession();
//     await connector.close();

//     sessionStatus = null;
//     accounts = [];

//     reset();
//   }
// }
