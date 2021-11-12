part of '../pages.dart';

class RestaurantHomePage extends StatefulWidget {
  @override
  State<RestaurantHomePage> createState() => _RestaurantHomePageState();
}

class _RestaurantHomePageState extends State<RestaurantHomePage> {
  late BarcodeModel barcodeModel;

  @override
  void initState() {
    print('RestaurantHomePage Navigator.of(context): ' +
        Navigator.of(context).toString());
    super.initState();
    x();
  }

  void x() async {
    await getInitialLink();
    await getOnLink();
    Provider.of<RestaurantServiceProvider>(context, listen: false)
        .init(context);
    Provider.of<MenuCategoryServiceProvider>(context, listen: false)
        .init(context);
    Provider.of<MenuServiceProvider>(context, listen: false).init(context);
    Provider.of<OrderProvider>(context, listen: false);
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
            Navigator.pop(context);
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

  Future<void> getOnLink() async {
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;

        if (deepLink != null) {
          print('ONLINK!');
          final provider = Provider.of<BarcodeProvider>(context, listen: false);
          print("deeplink data if dua : " + deepLink.toString());
          print("query param satu : " + deepLink.queryParameters.values.first);
          print("query param dua : " + deepLink.queryParameters.values.last);
          print('FINALY THE DEEPLINK VARIABLE IS NOT NULL :D');
          barcodeModel = new BarcodeModel(
              restaurantId: deepLink.queryParameters.values.first,
              restaurantTableId: deepLink.queryParameters.values.last);
          provider.data = barcodeModel;
        }
      },
      onError: (OnLinkErrorException e) async {
        print('DEEPLINK VARIABLE IS STILL NULL');
        print(e.message);
      },
    );

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }

  Future<void> getInitialLink() async {
    print("masuk initDynamicLink");

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      final provider = Provider.of<BarcodeProvider>(context, listen: false);
      print("deeplink data if dua : " + deepLink.toString());
      print("query param satu : " + deepLink.queryParameters.values.first);
      print("query param dua : " + deepLink.queryParameters.values.last);
      print("list deeplink : " +
          jsonEncode(deepLink.queryParameters.values.toList()));
      barcodeModel = new BarcodeModel(
          restaurantId: deepLink.queryParameters.values.first,
          restaurantTableId: deepLink.queryParameters.values.last);
      provider.data = barcodeModel;
    } else {
      print("deeplink null");
    }
  }
}
