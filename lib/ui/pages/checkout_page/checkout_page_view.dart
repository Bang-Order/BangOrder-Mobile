part of '../_pages.dart';

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
            CheckoutPageCartListComponent(
              key: Key('CheckoutPageCartListComponent'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutPageBottomNavBarComponent(
        key: Key('CheckoutPageBottomNavBarComponent'),
      ),
    );
  }
}
