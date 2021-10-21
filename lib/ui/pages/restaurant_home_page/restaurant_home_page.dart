part of '../pages.dart';

class RestaurantHomePage extends StatelessWidget {
  void callWebService(context) {
    Provider.of<RestaurantServiceProvider>(context, listen: false).init();
    Provider.of<MenuCategoryServiceProvider>(context, listen: false).init();
    Provider.of<MenuServiceProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    callWebService(context);
    return Scaffold(
      backgroundColor: lightGrayColor,
      appBar: AppBar(
        title: Consumer<RestaurantServiceProvider>(
          builder: (context, restaurant, _) => !restaurant.loading
              ? Text(
                  restaurant.data.name,
                  style: appbarTextStyle,
                )
              : Text(''),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackColor,
          ),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 4),
            child: IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: blackColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            RestaurantInfo(),
            SizedBox(height: 8),
            RecommendationMenu(),
            SizedBox(height: 8),
            CategoryHeaderList(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FabCheckout(),
    );
  }
}
