part of '../pages.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  late Future<List> futureCategoryHeader;
  late Future<List> futureMenuItem;

  @override
  void initState() {
    super.initState();
    futureCategoryHeader = fetchCategoryHeader();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List>(
        future: futureCategoryHeader,
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

  Widget _categoryHeader(data) {
    futureMenuItem = fetchMenuItems(data['kategori_menu']);

    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: defaultMargin / 2),
      child: ExpansionTile(
        title: Text(
          data['kategori_menu'],
          style: categoryHeaderStyle,
        ),
        children: [
          FutureBuilder<List>(
            future: futureMenuItem,
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
          )
        ],
      ),
    );
  }

  Widget _menuItem(data) {
    return Container(
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
                Text(data['nama'], style: menuTitleStyle),
                SizedBox(height: defaultMargin / 2),
                Text(data['deskripsi'], style: menudescriptionStyle),
                SizedBox(height: defaultMargin / 2),
                Text(data['harga'].toString(), style: menuPriceStyle),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(data['gambar']),
            ),
          )
        ],
      ),
    );
  }
}
