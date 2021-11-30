import 'dart:convert';

import 'package:bangorder_mobile/controller/_controller.dart';
import 'package:bangorder_mobile/models/models.dart';
import 'package:bangorder_mobile/providers/providers.dart';
import 'package:bangorder_mobile/services/services.dart';
import 'package:bangorder_mobile/ui/pages/pages.dart';
import 'package:bangorder_mobile/ui/widgets/widgets.dart';
import 'package:bangorder_mobile/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

part 'order_helper.dart';

part 'payment_helper.dart';

part 'detail_page.dart';

part 'history_helper.dart';
