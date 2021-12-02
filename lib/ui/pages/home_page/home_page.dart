part of '../pages.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
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
            await Future.delayed(Duration(milliseconds: 1000));
            CallApi().callApi(context);
            if (mounted) setState(() {});
            _refreshController.refreshCompleted();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                RestaurantInfo(),
                SizedBox(height: 8),
                HomepageRecommendationMenuComponent(),
                SizedBox(height: 8),
                HomepageMenuCategoryComponent(),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
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
    final barcode = Provider.of<BarcodeProvider>(context, listen: false);
    final restaurant = Provider.of<RestaurantServiceProvider>(
      context,
      listen: false,
    );
    if (barcode.data.restaurantId != restaurant.data.id.toString()) {
      CallApi().callApi(context);
    }
  }

  Future<void> _getOnLink() async {
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;

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
    final provider = Provider.of<BarcodeProvider>(context, listen: false);
    BarcodeModel barcodeModel = new BarcodeModel(
      restaurantId: deepLink.queryParameters.values.first,
      restaurantTableId: deepLink.queryParameters.values.last,
    );
    provider.data = barcodeModel;
  }
}
