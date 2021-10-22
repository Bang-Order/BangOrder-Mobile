part of '../../pages.dart';

class MenuItemList extends StatelessWidget {
  MenuCategory menuCategory;

  MenuItemList({Key? key, required this.menuCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuServiceProvider>(
      builder: (context, menu, _) => !menu.loading
          ? ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: menu.getMenuByCategoryId(menuCategory).length,
              itemBuilder: (context, i) {
                return _menuItem(
                  menu.getMenuByCategoryId(menuCategory)[i],
                  context,
                );
              },
            )
          : SizedBox(),
    );
  }

  Widget _menuItem(Menu data, context) {
    return InkWell(
      onTap: data.isAvailable == 1
          ? () {
              Navigator.push(
                context,
                // MaterialPageRoute(
                //   builder: (context) => DetailMenuPage(data),
                // ),
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => DetailMenuPage(data),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 2000),
                ),
              );
            }
          : null,
      splashColor: Colors.grey[100],
      child: Consumer<CartProvider>(
        builder: (context, cart, _) => Container(
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
                        style: data.isAvailable == 1
                            ? menuTitleStyle
                            : menuTitleTransparentStyle,
                      ),
                      SizedBox(
                        height: defaultMargin / 2,
                      ),
                      Text(
                        data.description,
                        style: data.isAvailable == 1
                            ? menudescriptionStyle
                            : menudescriptionTransparentStyle,
                      ),
                      SizedBox(
                        height: defaultMargin / 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currency(data.price),
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
                                  border: Border.all(color: yellowColor)),
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
    );
  }
}
