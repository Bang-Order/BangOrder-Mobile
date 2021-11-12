// part of '../pages.dart';
//
// class CheckoutPage extends StatelessWidget with WidgetsBindingObserver {
//   CheckoutPage({Key? key}) : super(key: key);
//   late BuildContext _context;
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     //this if statement should be checking the resume state of the application and success payment
//     if (state == AppLifecycleState.resumed) {
//       WidgetsBinding.instance!.removeObserver(this);
//       Navigator.push(
//         _context,
//         MaterialPageRoute(
//           builder: (context) => OrderStatusPage(),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance!.addObserver(this);
//     _context = context;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "Checkout",
//           style: appbarTextStyle,
//         ),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios_new_rounded,
//             color: blackColor,
//           ),
//           onPressed: () {
//             WidgetsBinding.instance!.removeObserver(this);
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Text(
//               "Review Order",
//               style: reviewOrder,
//             ),
//           ),
//           Consumer<CartProvider>(
//             builder: (context, cart, _) => Container(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: ListView.separated(
//                 shrinkWrap: true,
//                 controller: ScrollController(),
//                 itemBuilder: (context, index) => _customCard(
//                   cart.items[index],
//                   context,
//                 ),
//                 separatorBuilder: (context, index) => Divider(
//                   height: 16,
//                   color: blackColor,
//                 ),
//                 itemCount: cart.items.length,
//               ),
//             ),
//           )
//         ],
//       ),
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Total",
//                   style: metodePembayaranStyle,
//                 ),
//                 Consumer<CartProvider>(
//                   builder: (context, cart, _) => Text(
//                     currency(cart.getTotalPrice().toDouble()),
//                     style: totalPriceOrder,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: 12,
//             ),
//             child: ElevatedButton(
//               child: Text(
//                 "BAYAR",
//                 style: cartStyle,
//               ),
//               style: ElevatedButton.styleFrom(
//                 fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
//               ),
//               onPressed: () {
//                 OrderHelper(context).makeOrder();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _customCard(Menu data, BuildContext context) {
//     return Consumer<CartProvider>(
//       builder: (context, provider, _) => Container(
//         margin: EdgeInsets.symmetric(vertical: 8),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Text(
//                   data.quantity.toString() + 'x',
//                   style: cartStyle,
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       data.name.toString(),
//                       style: menuTitleStyle,
//                     ),
//                     SizedBox(height: 6),
//                     if (data.notes.text.isNotEmpty)
//                       Container(
//                         margin: const EdgeInsets.only(bottom: 6),
//                         child: Text(data.notes.text),
//                       ),
//                     InkWell(
//                       child: Text(
//                         "Edit",
//                         style: editTextCheckoutStyle,
//                       ),
//                       onTap: () => DetailPageHelper(context).navigate(
//                         menu: data,
//                         previousPage: PageEnum.HomePage,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   currency(data.price * data.quantity).toString(),
//                   style: menuTitleStyle,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

part of '../pages.dart';

class CheckoutPage extends StatelessWidget with WidgetsBindingObserver {
  CheckoutPage({Key? key}) : super(key: key);
  late BuildContext _context;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //this if statement should be checking the resume state of the application and success payment
    if (state == AppLifecycleState.resumed) {
      WidgetsBinding.instance!.removeObserver(this);
      Navigator.push(
        _context,
        MaterialPageRoute(
          builder: (context) => OrderStatusPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addObserver(this);
    _context = context;

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
          onPressed: () {
            WidgetsBinding.instance!.removeObserver(this);
            Navigator.pop(context);
          },
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
                itemBuilder: (context, index) => _customCard(
                  cart.items[index],
                  context,
                ),
                separatorBuilder: (context, index) => Divider(
                  height: 16,
                  color: blackColor,
                ),
                itemCount: cart.items.length,
              ),
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
            child: ElevatedButton(
              child: Text(
                "BAYAR",
                style: cartStyle,
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              ),
              onPressed: () {
                OrderHelper(context).makeOrder();
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
                    onTap: () => DetailPageHelper(context).navigate(
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
