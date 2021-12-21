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
        builder: (_) => controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : controller.orderHistory.isNotEmpty
                ? SingleChildScrollView(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: defaultMargin / 2,
                      ),
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
                : haveNotOrderedYet,
      ),
    );
  }

  Widget get haveNotOrderedYet {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Belum Ada Riwayat Pesanan',
              textAlign: TextAlign.center,
              style: orderListStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: Text(
              'Silahkan pesan terlebih dahulu',
              textAlign: TextAlign.center,
              style: successPopupTitle,
            ),
          ),
          Lottie.asset(
            'assets/images/empty_history.json',
            width: Get.width,
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => Get.off(
                ScanQrPage(),
                duration: Duration(milliseconds: 500),
              ),
              child: Text('Pesan Sekarang'),
            ),
          )
        ],
      ),
    );
  }
}
