part of '../_pages.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutPageController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: appbarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: blackColor,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                "Review Order",
                style: reviewOrder,
              ),
            ),
            GetBuilder(
              init: CartController(),
              builder: (_) => Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemBuilder: (context, index) => _customCard(
                    controller.cart.items[index],
                    context,
                  ),
                  separatorBuilder: (context, index) => Divider(
                    height: 16,
                    color: blackColor,
                  ),
                  itemCount: controller.cart.items.length,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
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
            padding: EdgeInsets.only(
              right: 16,
              bottom: 16,
              left: 16,
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
      ),
    );
  }

  Widget _customCard(Menu data, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Text(
                data.quantity.toString() + "x",
                style: cartStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    data.name.toString(),
                    style: menuTitleStyle,
                  ),
                  SizedBox(height: 6),
                  if (data.notes.text != '')
                    Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Text(data.notes.text),
                    ),
                  InkWell(
                    child: Text(
                      "Edit",
                      style: editTextCheckoutStyle,
                    ),
                    onTap: () =>
                        Get.put(DetailMenuPageController()).constructor(
                      menu: data,
                      previousPage: PageEnum.CheckoutPage,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                currency(double.parse(data.price) * data.quantity).toString(),
                style: menuTitleStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
