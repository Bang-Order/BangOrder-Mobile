part of '../pages.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: appbarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              "Review Order",
              style: reviewOrder,
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cart, _) => Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemBuilder: (context, index) {
                    return _customCard(cart.items[index], context);
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 16,
                        color: blackColor,
                      ),
                  itemCount: cart.items.length),
            ),
          )
        ],
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
                Consumer<CartProvider>(
                  builder: (context, cart, _) => Text(
                    currency(cart.getTotalPrice()),
                    style: totalPriceOrder,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Consumer<CartProvider>(
              builder: (context, cart, _) => ElevatedButton(
                child: Text(
                  "BAYAR",
                  style: cartStyle,
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                ),
                onPressed: () async {
                  final order = Order(
                    restaurantTableId: 1,
                    totalPrice: cart.getTotalPrice(),
                    orderItems: cart.items,
                  );
                  await postOrder(order);
                },
              ),
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
            )),
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
                  Text(
                    data.id.toString(),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailMenuPage(data),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                (data.price * data.quantity).toString(),
                style: menuTitleStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
