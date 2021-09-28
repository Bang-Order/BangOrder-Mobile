part of 'providers.dart';

class MenuProvider with ChangeNotifier {
  late List<Cart> _item;

  List<Cart> get item => _item;

  set item(List<Cart> value) {
    _item = value;
  }
}
