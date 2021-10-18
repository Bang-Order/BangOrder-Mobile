part of '../pages.dart';

class RecommendationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rekomendasi',
            style: recommendationHeader,
          ),
          SizedBox(height: defaultMargin),
          FutureBuilder<List<Menu>>(
            future: fetchRecommendationMenu(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  controller: ScrollController(),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int i) {
                    return _customCard(snapshot.data![i], context);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 20,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return HomepageLoadingScreen();
            },
          ),
          SizedBox(height: defaultMargin),
        ],
      ),
    );
  }

  Widget _customCard(Menu data, context) {
    return InkWell(
      onTap: (data.isAvailable == 1)
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMenuPage(data),
                ),
              );
            }
          : null,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    colorFilter: (data.isAvailable == 0)
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
              style: (data.isAvailable == 1)
                  ? recommendationTitle
                  : menuTitleTransparentStyle,
            ),
            SizedBox(height: defaultMargin / 2),
            Consumer<CartProvider>(
              builder: (context, cart, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currency(data.price),
                    style: (data.isAvailable == 1)
                        ? recommendationPrice
                        : menuPriceTransparentStyle,
                  ),
                  if (cart.isContainData(data)) ...[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: yellowColor,
                          border: Border.all(color: yellowColor)),
                      child: Text(
                        cart.getQuantity(data).toString() + "x",
                        style: menuQuantityStyle,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
