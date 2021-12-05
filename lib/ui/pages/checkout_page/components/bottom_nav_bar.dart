part of '../../../pages/_pages.dart';

class CheckoutPageBottomNavBarComponent extends StatelessWidget {
  const CheckoutPageBottomNavBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutPageController());

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: metodePembayaranStyle,
              ),
              GetBuilder(
                init: CartController(),
                builder: (_) => Text(
                  currency(controller.cart.getTotalPrice()),
                  style: totalPriceOrder,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: ElevatedButton(
            child: Text(
              "BAYAR",
              style: cartStyle,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            ),
            onPressed: () {
              Popup(context).showSuccessPopup();
              // controller.order.makeOrder(context);
            },
          ),
        ),
      ],
    );
  }
}
