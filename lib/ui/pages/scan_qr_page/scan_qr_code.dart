part of '../_pages.dart';

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
            Icons.arrow_back_outlined,
            color: blackColor,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: _buildQrView(context),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            top: MediaQuery.of(context).size.width * 1.2,
            child: Text(
              "Arahkan kamera anda ke QR Code yang tersedia pada meja",
              textAlign: TextAlign.center,
              style: scanTipsStyle,
            ),
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

  _checkingUrl(Barcode result) async {
    if (result.code.contains("https")) {
      print("masuk ke if satu");
      _launchUrl(result.code);
    } else {
      print("masuk ke else");
      final provider = Get.put(BarcodeController());
      barcodeModel = _decodeToString(result.code);
      provider.setData = barcodeModel;
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
    barcodeModel = _stringToJson(resultDecoded);
    return barcodeModel;
  }

  _stringToJson(String result) {
    Map<String, dynamic> valueBarcode = jsonDecode(result);
    var value = BarcodeModel.fromJson(valueBarcode);
    return value;
  }

  _launchUrl(String validUrl) async {
    String url = validUrl;
    print('URLURL: ' + url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
