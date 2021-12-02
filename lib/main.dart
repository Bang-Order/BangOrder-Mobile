import 'package:bangorder_mobile/shared/shared.dart';
import 'package:bangorder_mobile/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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
      initialRoute: '/',
      routes: {
        '/': (_) => LandingPage(),
        '/home': (_) => HomePage(),
        '/kZwrvR1p5eeVtcWU6': (_) => HomePage(),
        '/6hEqt7pc5DeTRbVGA': (_) => HomePage(),
        // '/home': (_) => OrderStatusPage(),
      },
    );
  }
}