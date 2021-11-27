part of '../../pages.dart';

class OrderStatusPageCardComponent extends StatelessWidget {
  final double statusBarHeight;
  final String title;
  final String? subTitle;
  final String? lottieURL;
  final String? lottieLocal;

  const OrderStatusPageCardComponent({
    Key? key,
    required this.title,
    this.lottieURL,
    this.subTitle,
    this.lottieLocal,
    required this.statusBarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.9 -
              AppBar().preferredSize.height -
              statusBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: orderStatusTitleStyle,
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
                SizedBox(height: 32),
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
    );
  }

  Widget _panel(scrollController) {
    final controller = Get.put(OrderStatusPageController());

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
          TotalPrice(
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
