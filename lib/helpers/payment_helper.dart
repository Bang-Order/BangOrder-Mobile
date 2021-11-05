part of 'helpers.dart';

class PaymentHelper {
  BuildContext _context;

  PaymentHelper(this._context);

  void navigateToWebView() {
    final provider = Provider.of<OrderProvider>(_context, listen: false);
    print(provider.getCurrentOrder!.invoiceUrl);
    Navigator.of(_context).push(MaterialPageRoute(
      builder: (BuildContext context) => WebViewPage(
        title: "Payment",
        selectedUrl: provider.getCurrentOrder!.invoiceUrl,
      ),
    ));
  }
}
