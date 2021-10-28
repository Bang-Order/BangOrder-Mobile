part of '../pages.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({Key? key}) : super(key: key);

  @override
  _ScanQrPageState createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _flashOn = false;
  Future<void>? _launched;

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
            Icons.arrow_back_ios_new_rounded,
            color: blackColor,
          ),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _buildQrView(context),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Positioned(
              top: 10,
              child: Container(
                  margin: EdgeInsets.only(right: 80, left: 80, bottom: 250),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Text(
                    "Arahkan kamera anda ke QR Code yang tersedia pada meja",
                    textAlign: TextAlign.center,
                    style: scanTipsStyle,
                  ),
                  color: Colors.transparent),
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 32, right: 32),
        child: FloatingActionButton(
          backgroundColor: Colors.black45,
          child: Icon(
            _flashOn ? Icons.flash_on : Icons.flash_off, color: Colors.white,),
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
    var scanArea = (MediaQuery
        .of(context)
        .size
        .width < 400 ||
        MediaQuery
            .of(context)
            .size
            .height < 400)
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
        result = scanData;
        print("halo2 " + result!.code);
        _checkingUrl(result!);
      });
    });
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

  _checkingUrl(Barcode result) {
    if (result.code.isNotEmpty || result.code != "") {
      if (result.code.contains("http") || result.code.contains("https")) {
        return _launchUrl(result.code);
      }
    } else {
      return ScanQrPage();
    }
  }

  _launchUrl(String validUrl) async {
    String url = validUrl;
    if (await canLaunch (url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
