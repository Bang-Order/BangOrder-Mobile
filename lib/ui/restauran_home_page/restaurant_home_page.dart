part of '../pages.dart';

class RestaurantHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CafeSejenak', style: appbarTextStyle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: blackColor),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 4),
            child: IconButton(
              icon: Icon(Icons.search_rounded, color: blackColor),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            //restaurant
            //RecomendationMenu
            MenuList()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<CartProvider>(
        builder: (context, cart, _) {
          return (cart.item.isNotEmpty)
              ? ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Checkout', style: fabCheckoutStyle),
                      Text(convertToCurrency(cart.getTotalPrice()),
                          style: fabTotalStyle),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      maximumSize: Size.fromWidth(
                          MediaQuery.of(context).size.width * 0.9),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16)),
                )
              : SizedBox();
        },
      ),
    );
  }
}
