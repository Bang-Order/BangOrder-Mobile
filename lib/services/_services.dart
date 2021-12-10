import 'dart:convert';
import 'dart:io';

import 'package:bangorder_mobile/controller/_controller.dart';
import 'package:bangorder_mobile/models/_models.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart' as http;

part 'menu_services.dart';

part 'menu_category_services.dart';

part 'restaurant_services.dart';

part 'order_services.dart';

// const BaseURL = 'http://192.168.1.6/BangOrder-Backend/public/api/';
const BaseURL = 'https://api.bangorder.me/api/';