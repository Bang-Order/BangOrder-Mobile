part of '../../../controller/_controller.dart';

class HomePageController extends GetxController {
  final api = Get.put(ApiController());
  final barcode = Get.put(BarcodeController());

  @override
  void onInit() async {
    await _getDeepLinkFromOutside();
    await _getDeepLinkFromInside();
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
          final controller = Get.put(HomePageController());
          controller.getDeeplinkSuccess(deepLink);
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
      final controller = Get.put(HomePageController());
      controller.getDeeplinkSuccess(deepLink);
    }
  }

  void getDeeplinkSuccess(deeplink) {
    barcode.setDataFromDeeplink(deeplink);
    api.callApi();
  }
}
