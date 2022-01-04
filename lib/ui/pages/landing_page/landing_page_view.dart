part of '../_pages.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _animation(
              child: Container(
                padding: EdgeInsets.only(right: 65, left: 65),
                margin: EdgeInsets.only(top: 50),
                height: 100,
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              millisecond: 0,
            ),
            _animation(
              child: Container(
                color: Colors.transparent,
                child: Text(
                  "Contactless Food Ordering using QR-Code with Payment Gateway",
                  style: menuTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              millisecond: 600,
            ),
            Expanded(
              flex: 1,
              child: _animation(
                millisecond: 700,
                child: Container(
                  color: Colors.transparent,
                  child: Lottie.asset(
                    'assets/images/scan_to_order.json',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
              ),
            ),
            _animation(
              millisecond: 800,
              child: Container(
                margin: EdgeInsets.only(bottom: 20, top: 80),
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(ScanQrPage());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                      ),
                      child: Text(
                        "Scan QR Code",
                        style: cartStyle,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(OrderHistoryPage());
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: yellowColor, width: 1.0),
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // <-- Radius
                        ),
                      ),
                      child: Text(
                        "Cek Status Pesanan",
                        style: cartStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _animation({required Widget child, required int millisecond}) {
    return ShowUpAnimation(
      delayStart: Duration(milliseconds: millisecond),
      animationDuration: Duration(milliseconds: 2000),
      curve: Curves.bounceIn,
      direction: Direction.vertical,
      offset: 0.5,
      child: child,
    );
  }
}
