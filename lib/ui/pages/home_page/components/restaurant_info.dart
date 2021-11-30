part of '../../pages.dart';

class RestaurantInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurant = context.watch<RestaurantServiceProvider>();
    final barcode = context.watch<BarcodeProvider>();
    bool _enabled = true;

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
                baseColor: Colors.yellow,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Colors.white,
                  height: 20,
                ),
              ),
              SizedBox(height: defaultMargin),
              Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.green,
                child: Container(
                  color: Colors.white,
                  height: 20,
                ),
              ),
              SizedBox(height: defaultMargin),
              Shimmer.fromColors(
                baseColor: Colors.purple,
                highlightColor: Colors.blue,
                child: Container(
                  color: Colors.white,
                  height: 20,
                ),
              ),
            ],
          ),
        );
  }
}
