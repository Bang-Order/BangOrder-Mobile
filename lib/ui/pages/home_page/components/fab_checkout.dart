part of '../../_pages.dart';

class HomepageFABComponent extends StatelessWidget {
  const HomepageFABComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutPageController());

    return GetBuilder(
      init: CartController(),
      builder: (_) => controller.cart.items.isNotEmpty
          ? ElevatedButton(
              onPressed: () {
                Get.to(
                  CheckoutPage(),
                  transition: Transition.cupertino,
                  duration: Duration(milliseconds: 500),
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
                    currency(controller.cart.getTotalPrice().toDouble()),
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
