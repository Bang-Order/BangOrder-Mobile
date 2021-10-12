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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Review Order",
              style: reviewOrder,
            ),
            Consumer<CartProvider>(
              builder: (context, cart, _) => ListView.separated(
                  padding: EdgeInsets.only(top: 16.0),
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemBuilder: (context, index) {
                    return _customCard(cart.item[index], context);
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 15,
                        color: Colors.black,
                      ),
                  itemCount: cart.item.length),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: Container(
                height: 8,
                width: MediaQuery.of(context).size.width,
                color: lightGrayColor,
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Metode Pembayaran",
                    style: metodePembayaranStyle,
                  ),
                  Row(children: [
                    Text(
                      "ShopeePay",
                      style: paymentOption,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentMethod(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: blackColor,
                        ))
                  ]),
                ],
              ),
            ),
            SizedBox(
              child: Container(
                height: 8,
                width: MediaQuery.of(context).size.width,
                color: lightGrayColor,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
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
              margin: EdgeInsets.only(right: 16, left: 16),
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "BAYAR",
                  style: cartStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customCard(Cart data, BuildContext context) {
    return Container(
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
                    data.menuName.toString(),
                    style: menuTitleStyle,
                  ),
                  (data.notes.toString().isNotEmpty)
                      ? Visibility(child: Text(data.notes.text), visible: true,)
                      : SizedBox(),
                  InkWell(
                      child: Text(
                        "Edit",
                        style: editTextCheckoutStyle,
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailMenuPage(
                        //       new Menu(
                        //         id: data.menuId,
                        //         name: data.menuName,
                        //         description: data.description,
                        //         price: data.price,
                        //         image: data.image,
                        //       ),
                        //     ),
                        //   ),
                        // );
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
