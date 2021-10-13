part of '../pages.dart';

class FabCheckout extends StatelessWidget {
  const FabCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, _) => (cart.items.isNotEmpty)
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
    );
  }
}
