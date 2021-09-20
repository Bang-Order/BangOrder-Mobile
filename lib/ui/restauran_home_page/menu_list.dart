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
      child: FutureBuilder<List<MenuCategories>>(
        future: fetchCategoryHeader(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int i) {
                  return _categoryHeader(snapshot.data![i]);
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return HomepageLoadingScreen();
        },
      ),
    );
  }

  Widget _categoryHeader(MenuCategories data) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: defaultMargin / 2),
      child: ExpansionTile(
        collapsedIconColor: Colors.black,
        iconColor: Colors.black,
        tilePadding: EdgeInsets.symmetric(horizontal: defaultMargin),
        title: Text(
          data.kategoriMenu,
          style: categoryHeaderStyle,
        ),
        children: [_fetchMenuItem(data)],
      ),
    );
  }

  Widget _fetchMenuItem(MenuCategories data) {
    return FutureBuilder<List<Menus>>(
      future: fetchMenuItem(data.kategoriMenu),
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

  Widget _menuItem(Menus data) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailMenuPage(data)),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(data.nama, style: menuTitleStyle),
                  SizedBox(height: defaultMargin / 2),
                  Text(data.deskripsi, style: menudescriptionStyle),
                  SizedBox(height: defaultMargin / 2),
                  Text(data.harga.toString(), style: menuPriceStyle),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(data.gambar),
              ),
            )
          ],
        ),
      ),
    );
  }
}
