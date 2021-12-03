part of '../../../pages/_pages.dart';

AppBar detailMenuPageAppbar(context) {
  final controller = Get.put(DetailMenuPageController());

  return AppBar(
    title: GetBuilder(
      init: DetailMenuPageController(),
      builder: (_) => Text(
        controller.menu.name,
        style: appbarTextStyle,
      ),
    ),
    leading: GetBuilder(
      init: DetailMenuPageController(),
      builder: (_) => IconButton(
        icon: Icon(
          Icons.arrow_back_outlined,
          color: blackColor,
        ),
        onPressed: controller.exit,
      ),
    ),
  );
}
