part of '../../../pages/pages.dart';

AppBar detailMenuPageAppbar(context) {
  return AppBar(
    title: Consumer<DetailPageProvider>(
      builder: (context, provider, _) => Text(
        provider.menu.name,
        style: appbarTextStyle,
      ),
    ),
    leading: Consumer<DetailPageProvider>(
      builder: (context, provider, _) => IconButton(
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
