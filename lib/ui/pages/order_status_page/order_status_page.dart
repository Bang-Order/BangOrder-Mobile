part of '../pages.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Status'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: blackColor,
          ),
          onPressed: () {
            // Navigator.of(context).pushAndRemoveUntil(
            //   MaterialPageRoute(
            //     builder: (context) => RestaurantHomePage(),
            //   ),
            //   (route) => false,
            // );
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('ORDER STATUS PAGE'),
      ),
    );
  }
}
