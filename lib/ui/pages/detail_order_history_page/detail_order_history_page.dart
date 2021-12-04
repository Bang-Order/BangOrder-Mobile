part of '../_pages.dart';

class DetailOrderHistoryPage extends StatelessWidget {
  const DetailOrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailOrderHistoryController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Order History'),
        leading: IconButton(
          padding: EdgeInsets.all(0),
          splashRadius: 20,
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
          onPressed: () {
            controller.exit();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: controller.orderHistory.orderItems.length,
        itemBuilder: (context, index) => Container(
          child: Text(controller.orderHistory.orderItems[index].name),
        ),
      ),
    );
  }
}
