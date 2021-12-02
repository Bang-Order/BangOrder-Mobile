part of '../pages.dart';

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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: defaultMargin / 2,
        ),
        child: FutureBuilder<List<OrderResponse>>(
          future: HistoryHelper.getAllOrder(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Center(child: Text('ORDER IS EMPTY'));
              }
              return ListView.separated(
                shrinkWrap: true,
                controller: ScrollController(),
                itemBuilder: (context, index) => HistoryCard(
                  data: snapshot.data![index],
                ),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
                itemCount: snapshot.data!.length,
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
