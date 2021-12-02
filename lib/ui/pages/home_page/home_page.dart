part of '../pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return Scaffold(
      body: GetBuilder<ApiController>(
        builder: (_) => !controller.api.isLoading
            ? NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  HomepageAppbarComponent(
                    innerBoxIsScrolled: innerBoxIsScrolled,
                    key: Key(
                      'HomepageAppbarComponent',
                    ),
                  ),
                ],
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      RestaurantInfo(),
                      SizedBox(height: 8),
                      HomepageRecommendationMenuComponent(),
                      SizedBox(height: 8),
                      HomepageMenuCategoryComponent(),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              )
            : HomePageLoadingScreen(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: HomepageFABComponent(
        key: Key('HomepageFABComponent'),
      ),
    );
  }
}
