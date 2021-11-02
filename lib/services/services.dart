import 'dart:convert';

import 'package:bangorder_mobile/models/models.dart';
import 'package:bangorder_mobile/providers/providers.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

part 'get_menu_category.dart';

part 'get_menu.dart';

part 'post_order.dart';

part 'get_restaurant_info.dart';

const APIURL = 'http://192.168.1.4/BangOrder-Backend/public/api/';
