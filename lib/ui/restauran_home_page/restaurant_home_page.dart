part of '../pages.dart';

class RestaurantHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: Consumer<ServicesProvider>(builder: (context, service, _) {
        return FutureBuilder<Map<String, dynamic>>(
          future: fetchHomePage,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              service.data = snapshot.data!;
              return _body;
            } else if (snapshot.hasError) {}
            return HomepageLoadingScreen();
          },
        );
      }),
    );
  }

  AppBar get _appbar {
    return AppBar(
      title: Text('CafeSejenak', style: appbarTextStyle),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: blackColor),
        onPressed: () {},
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 4),
          child: IconButton(
            icon: Icon(Icons.search_rounded, color: blackColor),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget get _body {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          //restaurant
          //RecomendationMenu
          MenuList()
        ],
      ),
    );
  }
}
