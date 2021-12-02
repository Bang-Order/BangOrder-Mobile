part of '../../../pages/pages.dart';

AppBar detailMenuPageAppbar(context) {
  final provider = Get.put(DetailMenuPageController());

  return AppBar(
    title: GetBuilder(
      init: DetailMenuPageController(),
      builder: (_) => Text(
        provider.menu.name,
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
        onPressed: () {
          provider.exit(context);
        },
      ),
    ),
  );
}
