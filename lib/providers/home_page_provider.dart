part of 'providers.dart';

class HomePageProvider extends ChangeNotifier {
  late BuildContext _context;
  bool _success = false;

  HomePageProvider(context) {
    this.context = context;
    print('HomePageProvider');
    // init();
  }

  Future<void> init() async {
    print('WE ARE ON INIT METHOD NOW!');
    if (await getURLFromOutside() || await getUrlFromInside()) {
      print('success = true => this is what suppose to be');
      success = true;
    } else {
      success = false;
    }
    notifyListeners();
  }

  Future<bool> getURLFromOutside() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      print('HomePageProvider getURLFromOutside: SUCCESS');
      insertDataToBarcodeProvider(deepLink);
      callApi();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getUrlFromInside() async {
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;
        if (deepLink != null) {
          print('HomePageProvider getUrlFromInside: SUCCESS');
          insertDataToBarcodeProvider(deepLink);
          callApi();
          return true;
        } else {
          print('HomePageProvider getUrlFromInside: FAILED');
          return false;
        }
      },
      onError: (OnLinkErrorException e) async {
        print(e.message);
        success = false;
        return false;
      },
    );
    return false;
  }

  void insertDataToBarcodeProvider(deepLink) {
    final provider = Provider.of<BarcodeProvider>(_context, listen: false);
    BarcodeModel barcodeModel = new BarcodeModel(
      restaurantId: deepLink.queryParameters.values.first,
      restaurantTableId: deepLink.queryParameters.values.last,
    );
    provider.data = barcodeModel;
    notifyListeners();
  }

  void callApi() {
    print('callApi');
    Provider.of<RestaurantServiceProvider>(_context, listen: false).init(
      _context,
    );
    Provider.of<MenuCategoryServiceProvider>(_context, listen: false).init(
      _context,
    );
    Provider.of<MenuServiceProvider>(_context, listen: false).init(
      _context,
    );
    notifyListeners();
  }

  BuildContext get context => _context;

  set context(BuildContext value) {
    _context = value;
    notifyListeners();
  }

  bool get success => _success;

  set success(bool value) {
    _success = value;
    notifyListeners();
  }
}
