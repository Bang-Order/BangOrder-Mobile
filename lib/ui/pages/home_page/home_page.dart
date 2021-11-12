part of '../pages.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      _callApi();
    }
  }

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
            Icons.arrow_back_outlined,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => LandingPage(
                  key: Key('LandingPage'),
                ),
              ),
              (route) => false,
            );
            // Navigator.popUntil(context, ModalRoute.withName('/'));
          },
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

  _callApi() {
    Provider.of<RestaurantServiceProvider>(
      context,
      listen: false,
    ).init(context);
    Provider.of<MenuCategoryServiceProvider>(
      context,
      listen: false,
    ).init(context);
    Provider.of<MenuServiceProvider>(
      context,
      listen: false,
    ).init(context);
    Provider.of<OrderProvider>(
      context,
      listen: false,
    );
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
