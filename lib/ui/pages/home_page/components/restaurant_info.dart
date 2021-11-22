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
        : SizedBox();
  }
}
