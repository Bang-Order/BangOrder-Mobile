part of '../../../pages/pages.dart';

class DetailMenuPageMenuInfo extends StatelessWidget {
  DetailMenuPageMenuInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Get.put(DetailMenuPageController());

    return GetBuilder(
      init: DetailMenuPageController(),
      builder: (_) => Container(
        color: Colors.white,
        padding: EdgeInsets.all(defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.menu.name,
                    style: detailMenuStyle,
                  ),
                  SizedBox(height: 6),
                  Text(
                    provider.menu.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: blackColor,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Manrope',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 18),
            Text(
              currency(double.parse(provider.menu.price)),
              style: detailMenuStyle,
            ),
          ],
        ),
      ),
    );
  }
}
