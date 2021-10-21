part of 'utils.dart';

class CallServices {
  CallServices(context) {
    Provider.of<RestaurantServiceProvider>(context, listen: false).init();
    Provider.of<MenuCategoryServiceProvider>(context, listen: false).init();
    Provider.of<MenuServiceProvider>(context, listen: false).init();
  }
}
