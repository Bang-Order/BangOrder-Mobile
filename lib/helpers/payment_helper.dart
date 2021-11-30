part of 'helpers.dart';

class PaymentHelper {
  BuildContext _context;

  PaymentHelper(this._context);

  void navigateToWebView() {
    // final provider = Provider.of<OrderProvider>(_context, listen: false);
    final order = Get.put(OrderController());
    // print(provider.getCurrentOrder!.invoiceUrl);

    Get.to(AfterOrderPage());
    // Navigator.of(_context).push(MaterialPageRoute(
    //   builder: (BuildContext context) => WebViewPage(
    //     title: "Payment",
    //     selectedUrl: order.getOrderResponse!.invoiceUrl,
    //   ),
    // ));
  }
}
