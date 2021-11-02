part of '../pages.dart';

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
            Container(
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
            Container(
              color: Colors.transparent,
              child: Text(
                "Contactless Food Ordering using QR-Code with Payment Gateway",
                style: menuTitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.transparent,
                child: Lottie.asset(
                  'assets/images/homepage_animation.json',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScanQrPage()));
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
                    onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
