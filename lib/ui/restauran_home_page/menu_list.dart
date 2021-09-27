part of '../pages.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesProvider>(
      builder: (context, service, _) {
        final data = service.data['menu-list'];
        return _categoryHeaderList(data);
      },
    );
  }

  Widget _categoryHeaderList(data) {
    return ListView.builder(
      controller: ScrollController(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int i) {
        return _categoryHeader(data[i]);
      },
    );
  }

  Widget _categoryHeader(data) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: defaultMargin / 2),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.only(bottom: defaultMargin / 2),
        iconColor: blackColor,
        tilePadding: EdgeInsets.symmetric(horizontal: defaultMargin),
        title: Text(
          data['category-name'],
          style: categoryHeaderStyle,
        ),
        children: [_menuItemList(data)],
      ),
    );
  }

  Widget _menuItemList(data) {
    return ListView.builder(
      controller: ScrollController(),
      shrinkWrap: true,
      itemCount: data['menu'].length,
      itemBuilder: (BuildContext context, int i) {
        Menu menu = Menu.fromJson(data['menu'][i]);
        return _menuItem(menu);
      },
    );
  }

  Widget _menuItem(Menu data) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailMenuPage(data)));
      },
      splashColor: Colors.grey[100],
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: defaultMargin / 2, horizontal: defaultMargin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(right: defaultMargin / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(data.name, style: menuTitleStyle),
                    SizedBox(height: defaultMargin / 2),
                    Text(data.description, style: menudescriptionStyle),
                    SizedBox(height: defaultMargin / 2),
                    Text(data.price.toString(), style: menuPriceStyle),
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
