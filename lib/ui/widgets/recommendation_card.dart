part of 'widgets.dart';

class RecommendationCard extends StatelessWidget {
  Menu data;
  BuildContext context;

  RecommendationCard({
    required this.data,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: data.isAvailable == 1
            ? () => DetailPageHelper(context).navigate(
                  menu: data,
                  previousPage: PageEnum.HomePage,
                )
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    colorFilter: data.isAvailable == 0
                        ? ColorFilter.mode(
                            Colors.black.withOpacity(0.5),
                            BlendMode.dstATop,
                          )
                        : null,
                    image: NetworkImage(data.image),
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
            Consumer<CartProvider>(
              builder: (context, cart, _) => Row(
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
