import 'dart:io';

import 'package:bangorder_mobile/ui/pages/_pages.dart';
import 'package:bangorder_mobile/ui/shared/_shared.dart';
import 'package:bangorder_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) {
    HttpOverrides.global = MyHttpOverrides();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bangorder',
      theme: ThemeData(
        primarySwatch: yellowColor,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => LandingPage(),
        ),
        GetPage(
          name: '/:id',
          page: () => HomePage(),
          transition: Transition.cupertino,
        ),
      ],
    );
  }
}
