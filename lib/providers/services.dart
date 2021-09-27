part of 'providers.dart';

class ServicesProvider with ChangeNotifier {
  late Map<String, dynamic> _data;

  Map<String, dynamic> get data => _data;

  set data(Map<String, dynamic> value) {
    _data = value;
  }
}
