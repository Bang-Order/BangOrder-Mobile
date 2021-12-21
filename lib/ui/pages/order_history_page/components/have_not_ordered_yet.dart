part of '../../_pages.dart';

class HaveNotOrderedYet extends StatelessWidget {
  const HaveNotOrderedYet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Belum Ada Riwayat Pesanan',
              textAlign: TextAlign.center,
              style: orderListStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: Text(
              'Silahkan pesan terlebih dahulu',
              textAlign: TextAlign.center,
              style: successPopupTitle,
            ),
          ),
          Lottie.asset(
            'assets/images/empty_history.json',
            width: Get.width,
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => Get.off(
                ScanQrPage(),
                duration: Duration(milliseconds: 500),
              ),
              child: Text(
                'Pesan Sekarang',
                style: cartStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
