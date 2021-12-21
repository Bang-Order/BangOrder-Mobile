part of '_widgets.dart';

class MenuCard extends StatelessWidget {
  Menu data;
  BuildContext context;
  PageEnum? prevPage;

  MenuCard({
    required this.data,
    required this.context,
    this.prevPage,
  });

  @override
  Widget build(BuildContext context) {
    print('this.prevPage: ' + this.prevPage.toString());
    final cart = Get.put(CartController());

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: data.isAvailable == 1
            ? () => Get.put(DetailMenuPageController()).constructor(
                  menu: data,
                  previousPage: prevPage!,
                )
            : null,
        child: GetBuilder(
          init: CartController(),
          builder: (_) => Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: cart.isContainData(data) ? yellowColor : Colors.white,
                  width: 3.0,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: defaultMargin / 2,
              horizontal: defaultMargin,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: defaultMargin,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          data.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: data.isAvailable == 1
                              ? menuTitleStyle
                              : menuTitleTransparentStyle,
                        ),
                        if (data.description != null &&
                            data.description != 'null') ...[
                          SizedBox(
                            height: defaultMargin / 2,
                          ),
                          Text(
                            data.description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: data.isAvailable == 1
                                ? menudescriptionStyle
                                : menudescriptionTransparentStyle,
                          ),
                        ],
                        SizedBox(
                          height: defaultMargin / 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              currency(double.parse(data.price)),
                              style: data.isAvailable == 1
                                  ? menuPriceStyle
                                  : menuPriceTransparentStyle,
                            ),
                            if (cart.isContainData(data))
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 1,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: yellowColor,
                                  border: Border.all(color: yellowColor),
                                ),
                                child: Text(
                                  cart.getQuantity(data).toString() + "x",
                                  style: menuQuantityStyle,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: data.isAvailable == 1
                        ? Image.network(
                            data.image,
                          )
                        : ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.dstATop,
                            ),
                            child: Image.network(
                              data.image,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
