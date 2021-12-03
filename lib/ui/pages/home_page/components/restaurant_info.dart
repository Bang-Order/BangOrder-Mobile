part of '../../_pages.dart';

class RestaurantInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(controller.api.restaurant.getData!.name, style: quantityStyle),
          SizedBox(height: defaultMargin),
          Text(
            controller.api.restaurant.getData!.address,
            style: restaurantDescriptionStyle,
            maxLines: 2,
          ),
          SizedBox(height: defaultMargin),
          Text(
            "Nomor Meja: " + controller.barcode.getData!.restaurantTableId,
            style: menuTitleStyle,
          ),
        ],
      ),
    );
  }
}
