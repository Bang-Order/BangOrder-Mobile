part of '../../_pages.dart';

class OrderStatusPageView extends StatelessWidget {
  final double statusBarHeight;
  final String title;
  final String? subTitle;
  final String? lottieURL;
  final String? lottieLocal;

  const OrderStatusPageView({
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

    return WillPopScope(
      onWillPop: () async {
        return await Get.offAll(LandingPage());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Status Pesanan',
            style: appbarTextStyle,
          ),
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
              maxHeight: MediaQuery.of(context).size.height * 0.5,
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
      ),
    );
  }

  Widget _panel(scrollController) {
    final controller = Get.put(AfterOrderPageController());

    return Container(
      // margin: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: defaultMargin * 2,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Detail Pesanan",
                style: orderListStyle,
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.all(defaultMargin / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Info Restoran",
                    style: orderListStyle,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    minLeadingWidth: 20,
                    title: Text(
                      controller.orderHistory.restaurantName,
                      style: orderedMenuPriceStyle,
                    ),
                    leading: ClipRRect(
                      child: Image.network(
                        controller.orderHistory.imageUrl,
                        height: 32,
                        width: 32,
                      ),
                    ),
                    trailing: Text(
                      "Meja ${controller.orderHistory.tableNumber}",
                      style: menuTitleStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin / 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.all(defaultMargin / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daftar Pesanan',
                    style: orderListStyle,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemCount: controller.getOrderedMenu()!.length,
                        itemBuilder: (context, index) => _customCard(
                          controller.orderHistory.orderItems[index],
                          context,
                        ),
                        separatorBuilder: (context, index) => Divider(
                          height: defaultMargin / 2,
                          color: darkGrayColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin / 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.all(defaultMargin / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Info Pembayaran",
                    style: orderListStyle,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  StreamBuilder(
                    stream: controller.getPaymentMethod.onValue,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (controller.isTrue(snapshot)) {
                        controller.paymentMethod = snapshot.data.snapshot.value;
                        print("masuk if");
                        print("payment///: ${controller.paymentMethod}");
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      Get.put(OrderHistoryPageController())
                                          .decisionLogoPaymentMethod(
                                              controller.paymentMethod),
                                      height: 32,
                                      width: 32,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    controller.paymentMethod,
                                    style: fabCheckoutStyle,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              controller.orderHistory.totalPrice,
                              style: cartStyle,
                            ),
                          ],
                        );
                      } else {
                        print("masuk else");
                        print("payment///: ${controller.paymentMethod}");
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      Get.put(OrderHistoryPageController())
                                          .decisionLogoPaymentMethod(
                                        controller.paymentMethod != ''
                                            ? controller.paymentMethod
                                            : controller
                                                .orderHistory.paymentMethod!,
                                      ),
                                      height: 32,
                                      width: 32,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    controller.paymentMethod != ''
                                        ? controller.paymentMethod
                                        : controller
                                            .orderHistory.paymentMethod!,
                                    style: fabCheckoutStyle,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              controller.orderHistory.totalPrice,
                              style: cartStyle,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: totalPriceOrder,
                        ),
                        Text(
                          controller.orderHistory.totalPrice,
                          style: totalPriceOrder,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
          ],
        ),
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
            'Lihat Detail Pesanan',
            style: orderListHeaderStyle,
          ),
        ],
      ),
    );
  }

  Widget _customCard(OrderItem data, BuildContext context) {
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
                  if (data.notes != null) ...[
                    SizedBox(height: 6),
                    Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        data.notes!,
                        style: menuSubTitleStyle,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                data.price,
                style: menuTitleStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
