part of '../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApiController());

    return Scaffold(
      body: GetBuilder<ApiController>(
        builder: (_) => !controller.isLoading
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

  @override
  void initState() {
    print('Navigator.of(context): ' + Navigator.of(context).toString());
    super.initState();
    _init();
  }

  void _init() async {
    await _getInitialLink();
    await _getOnLink();

    final barcode = Get.put(BarcodeController());
    final restaurant = Get.put(RestaurantController());

    // Get.delete<HomePageController>();
    if (restaurant.getData != null &&
        barcode.getData!.restaurantId != restaurant.getData!.id.toString()) {
      Get.delete<ApiController>();
    }
  }

  Future<void> _getOnLink() async {
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;
        print('deepLink!.path: '+deepLink!.path);

        if (deepLink != null) {
          _insertDataToBarcodeProvider(deepLink);
        } else {
          print("deeplink null from _getOnLink()");
        }
      },
      onError: (OnLinkErrorException e) async {
        print(e.message);
      },
    );
  }

  Future<void> _getInitialLink() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      _insertDataToBarcodeProvider(deepLink);
    } else {
      print("deeplink null from _getInitialLink()");
    }
  }

  void _insertDataToBarcodeProvider(deepLink) {
    final provider = Get.put(BarcodeController());
    BarcodeModel barcodeModel = new BarcodeModel(
      restaurantId: deepLink.queryParameters.values.first,
      restaurantTableId: deepLink.queryParameters.values.last,
    );
    provider.setData = barcodeModel;
  }
}
