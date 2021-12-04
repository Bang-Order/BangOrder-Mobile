part of '../../_pages.dart';

class OrderStatusPage extends StatelessWidget {
  final double statusBarHeight;
  final String title;
  final String? subTitle;
  final String? lottieURL;
  final String? lottieLocal;

  const OrderStatusPage({
    Key? key,
    required this.title,
    this.lottieURL,
    this.subTitle,
    this.lottieLocal,
    required this.statusBarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AfterOrderPageController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Status Page'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: blackColor,
          ),
          onPressed: () {
            if (title == 'Sudah Diantar') {
              Get.put(OrderController()).setOrderResponse = null;
              controller.dispose();
            }
            Get.offAll(LandingPage());
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.9 -
                AppBar().preferredSize.height -
                statusBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: orderStatusTitleStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                if (lottieURL != null)
                  Lottie.network(
                    lottieURL!,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                if (lottieLocal != null)
                  Lottie.asset(
                    lottieLocal!,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                if (subTitle != null) ...[
                  Text(
                    subTitle!,
                    style: orderStatusSubTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
          SlidingUpPanel(
            backdropEnabled: true,
            maxHeight: MediaQuery.of(context).size.height * 0.6,
            minHeight: MediaQuery.of(context).size.height * 0.1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            panelBuilder: (scrollController) => _panel(scrollController),
            collapsed: _collapsedPanel(),
          ),
        ],
      ),
    );
  }

  Widget _panel(scrollController) {
    final controller = Get.put(AfterOrderPageController());

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Text(
              'Daftar Pesanan',
              style: orderListStyle,
            ),
          ),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                itemCount: controller.getOrderedMenu()!.length,
                itemBuilder: (context, index) => OrderedMenuCard(
                      quantity: controller
                          .getOrderedMenu()![index]
                          .quantity
                          .toString(),
                      menuName: controller.getOrderedMenu()![index].name,
                      price: controller.getOrderedMenu()![index].price,
                    )
                // Text(controller.getOrderedMenu()![index].name),
                ),
          ),
          TotalPriceWidget(
            price: controller.getTotalPrice(),
          ),
        ],
      ),
    );
  }

  Widget _collapsedPanel() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.expand_less_rounded,
          ),
          Text(
            'Lihat Daftar Pesanan',
            style: orderListHeaderStyle,
          ),
        ],
      ),
    );
  }
}
