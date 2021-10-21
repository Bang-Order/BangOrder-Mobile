part of '../pages.dart';

class InfoRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantServiceProvider>(
      builder: (context, restaurant, _) => !restaurant.loading
          ? _restaurantCard(restaurant.data, context)
          : HomepageLoadingScreen(),
    );
  }

  Widget _restaurantCard(RestaurantInfo data, BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Image.network(
              data.image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(data.name, style: quantityStyle)),
                Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(
                      data.address,
                      style: restaurantDescriptionStyle,
                      maxLines: 2,
                    )),
                Text("Meja Nomor: 3", style: menuTitleStyle)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
