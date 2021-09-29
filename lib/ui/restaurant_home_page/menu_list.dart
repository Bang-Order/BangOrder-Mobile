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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMenuPage(data),
          ),
        );
      },
      splashColor: Colors.grey[100],
      child: Container(
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
                  right: defaultMargin / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      data.name,
                      style: menuTitleStyle,
                    ),
                    SizedBox(
                      height: defaultMargin / 2,
                    ),
                    Text(
                      data.description,
                      style: menudescriptionStyle,
                    ),
                    SizedBox(
                      height: defaultMargin / 2,
                    ),
                    Text(
                      currency(data.price),
                      style: menuPriceStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(data.image),
              ),
            )
          ],
        ),
      ),
    );
  }
}
