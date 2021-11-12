part of '../../pages.dart';

class RHPFabCheckout extends StatelessWidget {
  const RHPFabCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, order, _) => Consumer<CartProvider>(
        builder: (context, cart, _) => order.getCurrentOrder != null
            ? ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderStatusPage(),
                    ),
                  );
                },
                child: Text(
                  'Pesanan Anda Sedang Dimasak',
                  style: fabCheckoutStyle,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fixedSize: Size.fromWidth(
                    MediaQuery.of(context).size.width * 0.9,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                ),
              )
            : cart.items.isNotEmpty
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutPage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Checkout',
                          style: fabCheckoutStyle,
                        ),
                        Text(
                          currency(cart.getTotalPrice()),
                          style: fabTotalStyle,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      maximumSize: Size.fromWidth(
                        MediaQuery.of(context).size.width * 0.9,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                  )
                : SizedBox(),
      ),
    );
  }
}
