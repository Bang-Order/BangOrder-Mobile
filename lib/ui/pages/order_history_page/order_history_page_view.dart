part of '../_pages.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderHistoryPageController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pesanan'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: blackColor,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: GetBuilder<OrderHistoryPageController>(
        builder: (_) => controller.orderHistory.isNotEmpty
            ? Container(
                padding: EdgeInsets.symmetric(
                  vertical: defaultMargin / 2,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemCount: controller.orderHistory.length,
                  itemBuilder: (context, index) => HistoryCard(
                    data: controller.orderHistory[index],
                    // data: snapshot.data![index],
                  ),
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
                ),
              )
            : Center(child: Text('ORDER IS EMPTY')),
      ),
    );
  }
}
