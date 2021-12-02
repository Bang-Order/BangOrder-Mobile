part of '../../pages.dart';

class HomepageFABComponent extends StatelessWidget {
  const HomepageFABComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutPageController());

    return GetBuilder(
      init: OrderController(),
      builder: (_) => controller.order.getOrderResponse != null
          ? ElevatedButton(
              onPressed: () {
                Get.to(AfterOrderPage());
              },
              child: Text(
                'Status Pesanan',
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
          : GetBuilder(
              init: CartController(),
              builder: (_) => controller.cart.items.isNotEmpty
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
                            currency(
                                controller.cart.getTotalPrice().toDouble()),
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
