part of '../pages.dart';

class RestaurantHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: Text('CafeSejenak', style: appbarTextStyle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: blackColor),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 4),
            child: IconButton(
              icon: Icon(Icons.search_rounded, color:blackColor),
              onPressed: () {},
            ),
          ),
        ],
=======
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
>>>>>>> 91cd68e2cf252b4ca33f027acd8d82b71fddf117
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
