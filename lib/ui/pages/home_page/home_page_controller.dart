part of '../../../controller/_controller.dart';

class HomePageController extends GetxController {
  ScrollController scrollController = ScrollController();
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  final api = Get.put(ApiController());
  final barcode = Get.put(BarcodeController());

  @override
  void onInit() async {
    getDeeplinkSuccess(Uri.parse('https://google.com?restaurant=1&table_id=1'));
    // await _getDeepLinkFromOutside();
    // await _getDeepLinkFromInside();
    super.onInit();
  }

  @override
  void dispose() {
    Get.delete<HomePageController>();
    Get.delete<CartController>();
  }

  Future<bool> exit() {
    Get.offAll(LandingPage());
    dispose();
    return Future.value(true);
  }

  Future<void> _getDeepLinkFromInside() async {
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;
        if (deepLink != null) {
          getDeeplinkSuccess(deepLink);
        } else {
          Get.back();
        }
      },
      onError: (OnLinkErrorException e) async {
        print(e.message);
        Get.back();
      },
    );
  }

  Future<void> _getDeepLinkFromOutside() async {
    print('_getInitialLink');
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      getDeeplinkSuccess(deepLink);
    }
  }

  void getDeeplinkSuccess(deeplink) {
    barcode.setDataFromDeeplink(deeplink);
    api.callApi();
  }

  void onRefresh() async {
    await api.callApi();
    refreshController.refreshCompleted();
  }

  int getMenuCategoryItemCount() {
    int itemCount = api.menuCategory.data.length;

    if (api.menu.isMenuCategoryEmpty()) {
      return itemCount + 1;
    }
    return itemCount;
  }

  bool isMenuCategoryEmpty() {
    return api.menu.isMenuCategoryEmpty();
  }
}
