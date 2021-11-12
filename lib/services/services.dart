import 'dart:convert';

import 'package:bangorder_mobile/helpers/helpers.dart';
import 'package:bangorder_mobile/models/models.dart';
import 'package:bangorder_mobile/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

part 'menu_services.dart';

part 'menu_category_services.dart';

part 'restaurant_services.dart';

part 'order_services.dart';

const BaseURL =
    'http://192.168.1.4/BangOrder-Backend/public/api/';
