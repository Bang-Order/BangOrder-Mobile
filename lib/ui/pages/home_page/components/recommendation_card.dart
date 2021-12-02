part of '../../../pages/pages.dart';

class RecommendationCard extends StatelessWidget {
  Menu data;
  BuildContext context;

  RecommendationCard({
    required this.data,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Get.put(CartController());

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: data.isAvailable == 1
            ? () => Get.put(DetailMenuPageController()).constructor(
                  menu: data,
                  previousPage: PageEnum.HomePage,
                )
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: data.isAvailable == 1
                    ? Image.network(
                        data.image,
                        fit: BoxFit.cover,
                      )
                    : ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5),
                          BlendMode.dstATop,
                        ),
                        child: Image.network(
                          data.image,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            SizedBox(height: defaultMargin / 2),
            Text(
              data.name,
              style: data.isAvailable == 1
                  ? recommendationTitle
                  : menuTitleTransparentStyle,
            ),
            SizedBox(height: defaultMargin / 2),
            GetBuilder(
              init: CartController(),
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currency(double.parse(data.price)),
                    style: data.isAvailable == 1
                        ? recommendationPrice
                        : menuPriceTransparentStyle,
                  ),
                  if (cart.isContainData(data))
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: yellowColor,
                        border: Border.all(
                          color: yellowColor,
                        ),
                      ),
                      child: Text(
                        cart.getQuantity(data).toString() + "x",
                        style: menuQuantityStyle,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
