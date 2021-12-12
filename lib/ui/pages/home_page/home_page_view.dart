part of '../_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    final controller = Get.put(HomePageController());
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    return WillPopScope(
      onWillPop: () => controller.exit(),
      child: Scaffold(
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
                  body: SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: false,
                    enablePullDown: true,
                    header: WaterDropHeader(
                      waterDropColor: yellowColor,
                    ),
                    onRefresh: () async {
                      //monitor fetch data from network
                      await controller.api.callApi();
                      _refreshController.refreshCompleted();
                    },
                    child: VsScrollbar(
                      controller: _scrollController,
                      showTrackOnHover: true,// default false
                      isAlwaysShown: true, // default false
                      scrollbarFadeDuration: Duration(milliseconds: 500), // default : Duration(milliseconds: 300)
                      scrollbarTimeToFade: Duration(milliseconds: 800),// default : Duration(milliseconds: 600)
                      style: VsScrollbarStyle(
                        hoverThickness: 10.0, // default 12.0
                        radius: Radius.circular(10), // default Radius.circular(8.0)
                        thickness: 10.0, // [ default 8.0 ]
                        color: Colors.purple.shade900, // default ColorScheme Theme
                      ),
                      child: SingleChildScrollView(
                        controller: _scrollController,
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
                    ),
                  ),
                )
              : HomePageLoadingScreen(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: HomepageFABComponent(
          key: Key('HomepageFABComponent'),
        ),
      ),
    );
  }
}
