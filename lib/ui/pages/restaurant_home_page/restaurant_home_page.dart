part of '../pages.dart';

class RestaurantHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<Menu>(
                  items: Provider.of<MenuServiceProvider>(
                    context,
                    listen: false,
                  ).data,
                  builder: (t) => MenuCard(
                    data: t,
                    context: context,
                    prevPage: PageEnum.SearchPage,
                  ),
                  filter: (t) => [t.name],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  RestaurantInfo(),
                  SizedBox(height: 8),
                  RecommendationMenu(),
                  SizedBox(height: 8),
                  RHPCategoryHeaderList(),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RHPFabCheckout(),
    );
  }
}
