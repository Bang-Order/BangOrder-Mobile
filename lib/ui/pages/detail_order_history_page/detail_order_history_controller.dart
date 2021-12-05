part of '../../../controller/_controller.dart';

class DetailOrderHistoryController extends GetxController {
  late OrderHistory orderHistory;

  void goToPage(OrderHistory orderHistory) {
    this.orderHistory = orderHistory;
    update();
    Get.to(DetailOrderHistoryPage(key: Key('DetailOrderHistoryPage')));
  }

  DetailOrderHistoryPage returnPage(OrderHistory orderHistory) {
    this.orderHistory = orderHistory;
    update();

    return DetailOrderHistoryPage(key: Key('DetailOrderHistoryPage'));
  }

  void exit() {
    Get.close(2);
  }
}
