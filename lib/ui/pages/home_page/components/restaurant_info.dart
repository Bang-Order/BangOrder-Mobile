part of '../../pages.dart';

class RestaurantInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurant = context.watch<RestaurantServiceProvider>();
    final barcode = context.watch<BarcodeProvider>();

    return !restaurant.loading
        ? Container(
            color: Colors.white,
            padding: EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(restaurant.data.name, style: quantityStyle),
                SizedBox(height: defaultMargin),
                Text(
                  restaurant.data.address,
                  style: restaurantDescriptionStyle,
                  maxLines: 2,
                ),
                SizedBox(height: defaultMargin),
                Text(
                  "Nomor Meja: " + barcode.data.restaurantTableId,
                  style: menuTitleStyle,
                ),
              ],
            ),
          )
        : Container(
            color: Colors.white,
            padding: EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    height: 20,
                    margin: EdgeInsets.only(right: 150),
                  ),
                ),
                SizedBox(height: defaultMargin),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    height: 10,
                    margin: EdgeInsets.only(right: 50),
                  ),
                ),
                SizedBox(height: defaultMargin),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  period: Duration(seconds: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    height: 10,
                    margin: EdgeInsets.only(right: 250),
                  ),
                ),
              ],
            ),
          );
  }
}
