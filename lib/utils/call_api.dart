part of 'utils.dart';

class CallApi {
  void callApi(context) {
    Provider.of<RestaurantServiceProvider>(
      context,
      listen: false,
    ).init(context);
    Provider.of<MenuCategoryServiceProvider>(
      context,
      listen: false,
    ).init(context);
    Provider.of<MenuServiceProvider>(
      context,
      listen: false,
    ).init(context);
    Provider.of<OrderProvider>(
      context,
      listen: false,
    );
  }
}