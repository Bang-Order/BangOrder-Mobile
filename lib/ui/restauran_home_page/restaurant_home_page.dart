part of '../pages.dart';

class RestaurantHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            //restaurant
            //RecomendationMenu
            MenuList()
          ],
        ),
      ),
    );
  }
}
