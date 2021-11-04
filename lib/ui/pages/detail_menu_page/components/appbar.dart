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
          Icons.arrow_back_ios_new_rounded,
          color: blackColor,
        ),
        onPressed: () {
          // if (_menu.isUpdate) {
          //   widget._data.quantity = _initQuantity;
          //   widget._data.notes.text = _initNotes;
          // }
          // provider.pop(context);
          Navigator.pop(context);
        },
      ),
    ),
  );
}
