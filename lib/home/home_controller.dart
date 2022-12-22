import 'package:depay_v2/splash/model/app_info.dart';
import 'package:depay_v2/splash/wallet_connect_helper.dart';
import 'package:eip55/eip55.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';
import 'package:web3dart/web3dart.dart';

class HomeController extends GetxController {
  final box = GetStorage();
 
 var walletName='metamask'.obs;
  var displayUri = ''.obs;
  var _account = ''.obs;
  var session = WalletConnectSession(accounts: []).obs;

  final String ethRinkebyTestnetEndpoints =
      'https://goerli.infura.io/v3/45e42f4dc9244dd7b11e113a7f092a26';

  final WalletConnectHelper walletConnectHelper = WalletConnectHelper(
    appInfo: AppInfo(
      name: "DePay",
      url: "https://example.mobile.com",
    ),
   
  );

  late Web3Client web3client;
  // late StreamChicken2Contract contract;

  final TextEditingController fromAddressEditController =
      TextEditingController();
  final TextEditingController toAddressEditController = TextEditingController();
  final TextEditingController tokenIdEditController = TextEditingController();

  var isConnectWallet = false.obs;
  String publicWalletAddress = "";

  @override
  void onInit() {
    super.onInit();
    walletConnectHelper;
    setSession();
  }

  void metaconnectWallet() async {
    isConnectWallet.value = await walletConnectHelper.metainitSession();
    print("Hommeee ${isConnectWallet.value}");
    if (isConnectWallet.value) {
      publicWalletAddress = walletConnectHelper
          .getEthereumCredentials()
          .getEthereumAddress()
          .toString();
      publicWalletAddress = toEIP55Address(publicWalletAddress);

      // Init
      initWeb3Client();
      initContract();
      fromAddressEditController.text = publicWalletAddress;
      toAddressEditController.text =
          '0x3D7BAD4D04eE46280E29B5149EE1EAa0d5Ff649F';
      setSession();
      // Update
      update();
      // setState(() {});

    }
  }
   void trustconnectWallet() async {
    isConnectWallet.value = await walletConnectHelper.trustinitSession();
    print("Hommeee ${isConnectWallet.value}");
    if (isConnectWallet.value) {
      publicWalletAddress = walletConnectHelper
          .getEthereumCredentials()
          .getEthereumAddress()
          .toString();
      publicWalletAddress = toEIP55Address(publicWalletAddress);

      // Init
      initWeb3Client();
      initContract();
      fromAddressEditController.text = publicWalletAddress;
      toAddressEditController.text =
          '0x3D7BAD4D04eE46280E29B5149EE1EAa0d5Ff649F';
      setSession();
      // Update
      update();
      // setState(() {});

    }
  }

  void disconnectWallet() {
    walletConnectHelper.dispose();
    isConnectWallet.value = false;
    publicWalletAddress = '';
    tokenIdEditController.text = '';
    setSession();
    update();
    // setState(() {});
  }

  void initWeb3Client() {
    web3client = Web3Client(ethRinkebyTestnetEndpoints, Client());
  }

  void initContract() {
    // use contract(StreamChicken2) address
    final EthereumAddress contractAddress =
        EthereumAddress.fromHex('0xa1e767940e8fb953bbd8972149d2185071b86063');
    // use Rinkeby(test-chain), chain id is '4'
    // contract = StreamChicken2Contract(address: contractAddress, client: web3client, chainId: 4);
  }

  void setSession() {
    getSession().then((value) => value != null
        ? session.value = value
        : session.value = WalletConnectSession(accounts: []));
  }

  Future<WalletConnectSession?> getSession() async {
    final WalletConnectSecureStorage s = WalletConnectSecureStorage();
    final session = await s.getSession();

    return session;
  }

//  Future initMetaWallet()async{
//     // Define a session storage
//      final sessionStorage = WalletConnectSecureStorage();
//     final session = await sessionStorage.getSession();

//     // Create a connector
//     final connector = WalletConnect(
//       bridge: 'https://bridge.walletconnect.org',
//       session: session,
//       sessionStorage: sessionStorage,
//       clientMeta: PeerMeta(
//         name: 'WalletConnect',
//         description: 'WalletConnect Developer App',
//         url: 'https://URLwalletconnect.org',
//         icons: [
//           'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
//         ],
//       ),
//     //    metaAccount.value = session?.accounts.first ?? '';

//     // connector.registerListeners(
//     //   onConnect: (status) {
//     //     metaAccount.value = status.accounts[0];
//     //   },
//     // );
//     );

//     // Subscribe to events
//   }

//     ConnectMetamaskWallet(BuildContext context) async {
//       if (!connector.connected) {
//         try {
//           final session =
//               await connector.createSession(onDisplayUri: (_uri) async {
//             displayUri.value = _uri;
//             await launchUrlString(_uri, mode: LaunchMode.externalApplication);

//           });
//           print(session);
//         } catch (error) {
//           print("Bağlanırken hata oluştu: $error");
//         }
//       }
//     }

  void onReady() {
    super.onReady();
  }

  void onClose() {
    super.onClose();
  }
}
