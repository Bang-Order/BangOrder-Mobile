part of '../../../pages/_pages.dart';

class DetailMenuPageMenuInfo extends StatelessWidget {
  DetailMenuPageMenuInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMenuPageController());

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
                    controller.menu.name,
                    style: detailMenuStyle,
                  ),
                  if (controller.menu.description != null) ...[
                    SizedBox(height: 6),
                    Text(
                      controller.menu.description!,
                      style: TextStyle(
                        fontSize: 12,
                        color: blackColor,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: 18),
            Text(
              currency(double.parse(controller.menu.price)),
              style: detailMenuStyle,
            ),
          ],
        ),
      ),
    );
  }
}
