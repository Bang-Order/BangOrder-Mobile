part of '../pages.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({Key? key}) : super(key: key);

  @override
  _ScanQrPageState createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  Barcode? result;
  late BarcodeModel barcodeModel;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _flashOn = false;
  int scanOnce = 0;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan QR Code",
          style: appbarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(child: _buildQrView(context)),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(right: 80, left: 80, bottom: 250),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Arahkan kamera anda ke QR Code yang tersedia pada meja",
                  textAlign: TextAlign.center,
                  style: scanTipsStyle,
                ),
                color: Colors.transparent),
          )
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 32, right: 32),
        child: FloatingActionButton(
          backgroundColor: Colors.black45,
          child: Icon(
            _flashOn ? Icons.flash_on : Icons.flash_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _flashOn = !_flashOn;
            });
            controller!.toggleFlash();
          },
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 280.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: yellowColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutBottomOffset: 80,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        while (scanOnce == 0) {
          result = scanData;
          print("result.code: " + result!.code);
          _checkingUrl(result!);
          controller.pauseCamera();
          break;
        }
        scanOnce++;
        controller.resumeCamera();
      });
    });
  }

  void initDynamicLinks() async {
    print("masuk initDynamicLink");

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      final provider = Provider.of<BarcodeProvider>(context, listen: false);
      print("deeplink data if dua : " + deepLink.toString());
      print(
          "query param satu : " + deepLink.queryParameters.values.elementAt(0));
      print("query param dua : " + deepLink.queryParameters.values.last);
    } else {
      print("deeplink null");
    }
  }

  _checkingUrl(Barcode result) async {
    if (result.code.contains("https")) {
      print("masuk ke if satu");
      // _launchUrl(result.code);

      final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;

      if (deepLink != null) {
        final provider = Provider.of<BarcodeProvider>(context, listen: false);
        print("deeplink data if dua : " + deepLink.toString());
        print(
            "query param satu : " + deepLink.queryParameters.values.elementAt(0));
        print("query param dua : " + deepLink.queryParameters.values.last);
      } else {
        print("deeplink null");
      }

      // initDynamicLinks();
      // final provider = Provider.of<BarcodeProvider>(context, listen: false);
      // barcodeModel = _decodeToString(result.code);
      // provider.data = barcodeModel;

      // FirebaseDynamicLinks.instance.onLink(
      //     onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      //   final Uri? deeplink = dynamicLink!.link;
      //
      //   if (deeplink != null) {
      //     print("deeplink data if satu : " + deeplink.toString());
      //   } else {
      //     print("deeplink data : null");
      //   }
      // }, onError: (OnLinkErrorException e) async {
      //   print('onLinkError');
      //   print(e.message);
      // });
      //
      // final PendingDynamicLinkData? data =
      //     await FirebaseDynamicLinks.instance.getInitialLink();
      // final Uri? deepLink = data?.link;
      //
      // if (deepLink != null) {
      //   final provider = Provider.of<BarcodeProvider>(context, listen: false);
      //   print("deeplink data if dua : " + deepLink.toString());
      //   print("query param satu : " +
      //       deepLink.queryParameters.values.elementAt(0));
      //   print("query param dua : " + deepLink.queryParameters.values.last);
      //   print("deeplink path : " + deepLink.path);
      //   // barcodeModel = _stringToJson(deepLink.queryParameters.values.toString());
      //   // print("barcode Model : " + barcodeModel.toString());
      //   // barcodeModel = deepLink.queryParameters.values as BarcodeModel;
      //   // provider.data = barcodeModel;
      //   // print("provider data: " + provider.data.toString());
      //   // Get.toNamed(deepLink.queryParameters.values.toString());
      //   // Navigator.pushNamed(context, deepLink.path);
      //   // Navigator.of(context).pushNamed('/home');
      //   // Navigator.pushNamed(context, '/home', arguments: deepLink.queryParameters.values.last);
      // }
    }

    // if (result.code.contains("http") || result.code.contains("https")) {
    //   bool _validURL = Uri.tryParse(result.code)?.hasAbsolutePath ?? false;
    //   if (_validURL) {
    //     return _launchUrl(result.code);
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('invalid barcode')),
    //     );
    //   }
    // }

    else {
      print("masuk ke else");
      final provider = Provider.of<BarcodeProvider>(context, listen: false);
      barcodeModel = _decodeToString(result.code);
      provider.data = barcodeModel;
      // print("isi restaurant_id: " + provider.data.restaurantId);
      // print("isi restaurant_table_id: " + provider.data.restaurantTableId);
      // Navigator.of(context).pushNamed('/home');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => RestaurantHomePage()));

      // FirebaseDynamicLinks.instance.onLink(
      //     onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      //   final Uri? deeplink = dynamicLink!.link;
      //
      //   if (deeplink != null) {
      //     print("deeplink data if satu : " + deeplink.toString());
      //   } else {
      //     print("deeplink data : null");
      //   }
      // }, onError: (OnLinkErrorException e) async {
      //   print('onLinkError');
      //   print(e.message);
      // });
      //
      // final PendingDynamicLinkData? data =
      //     await FirebaseDynamicLinks.instance.getInitialLink();
      // final Uri? deepLink = data?.link;
      //
      // if (deepLink != null) {
      //   print("deeplink data if dua : " + deepLink.toString());
      //   print("query param satu : " +
      //       deepLink.queryParameters.values.elementAt(0));
      //   print("query param dua : " + deepLink.queryParameters.values.last);
      //   print("deeplink path : " + deepLink.path);
      //   // Get.toNamed(deepLink.queryParameters.values.toString());
      //   // Navigator.pushNamed(context, deepLink.path);
      //   Navigator.of(context).pushNamed('/home');
      //   // Navigator.pushNamed(context, '/home', arguments: deepLink.queryParameters.values.last);
      // }
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  _decodeToString(String result) {
    String resultDecoded = utf8.decode(base64.decode(result));
    // barcodeModel = _stringToJson(resultDecoded);
    return barcodeModel;
  }

  // _stringToJson(String result) {
  //   Map<String, dynamic> valueBarcode = jsonDecode(result);
  //   var value = BarcodeModel.fromJson(valueBarcode);
  //   return value;
  // }

  _launchUrl(String validUrl) async {
    String url = validUrl;
    if (await canLaunch(url)) {
      initDynamicLinks();
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
