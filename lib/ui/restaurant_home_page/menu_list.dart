part of '../pages.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return _fetchCategoryHeader();
  }

  Widget _fetchCategoryHeader() {
    return Container(
      child: FutureBuilder<List<MenuCategory>>(
        future: fetchCategoryHeader(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              controller: ScrollController(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int i) {
                return _categoryHeader(snapshot.data![i]);
              },
              separatorBuilder: (context, index) => Divider(
                height: 8,
                color: lightGrayColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return HomepageLoadingScreen();
        },
      ),
    );
  }

  Widget _categoryHeader(MenuCategory data) {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.only(
          bottom: defaultMargin / 2,
        ),
        iconColor: Colors.black,
        tilePadding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        title: Text(
          data.name,
          style: categoryHeaderStyle,
        ),
        children: [
          _fetchMenuItem(data),
        ],
      ),
    );
  }

  Widget _fetchMenuItem(MenuCategory data) {
    return FutureBuilder<List<Menu>>(
      future: fetchMenuItem(data.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i) {
              return _menuItem(snapshot.data![i]);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return SizedBox();
      },
    );
  }

  Widget _menuItem(Menu data) {
    return InkWell(
      onTap: (data.isAvailable == 1)
          ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMenuPage(data),
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
                color: (cart.isContainData(data)) ? yellowColor : Colors.white,
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
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(
                    right: defaultMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        data.id.toString(),
                      ),
                      Text(
                        data.name,
                        style: (data.isAvailable == 1)
                            ? menuTitleStyle
                            : menuTitleTransparentStyle,
                      ),
                      SizedBox(
                        height: defaultMargin / 2,
                      ),
                      Text(
                        data.description,
                        style: (data.isAvailable == 1)
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
                            style: (data.isAvailable == 1)
                                ? menuPriceStyle
                                : menuPriceTransparentStyle,
                          ),
                          if (cart.isContainData(data)) ...[
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
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: (data.isAvailable == 1)
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