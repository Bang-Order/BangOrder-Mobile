part of '_widgets.dart';

class Popup {
  BuildContext _context;
  Popup(this._context);

  void showSuccessPopup() {
    final controller = Get.put(CheckoutPageController());

    showDialog(
      context: _context,
      builder: (_context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.all(16),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Apakah Anda yakin dengan pesanan Anda?',
              textAlign: TextAlign.center,
              style: successPopupTitle,
            ),
            SizedBox(height: 16),
            Text(
              'Setelah ini, Anda akan diarahkan ke laman pembayaran untuk melanjutkan pembayaran dan menyelesaikan pesanan. Harap untuk menyelesaiakan pembayaran dalam waktu 15 menit.',
              textAlign: TextAlign.center,
              style: successPopupMessage,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Tidak',
                      style: successPopupButton,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: yellowColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (await controller.order.makeOrder()) {
                        final cart = Get.put(CartController());
                        cart.items = [];
                        Get.put(AfterOrderPageController()).goToPage(
                          orderHistory:
                          Get.put(OrderController()).getOrderResponse,
                        );
                      } else {
                        Get.back();
                        showFailedPopup();
                      }
                    },
                    child: Text(
                      'Ya',
                      style: successPopupButton,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showFailedPopup() {
    showDialog(
      context: _context,
      builder: (_context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.all(16),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Something Went Wrong Please Try Again',
              textAlign: TextAlign.center,
              style: successPopupTitle,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text(
                'Oke',
                style: successPopupButton,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
