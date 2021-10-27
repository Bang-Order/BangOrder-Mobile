import 'package:bangorder_mobile/providers/providers.dart';
import 'package:bangorder_mobile/shared/shared.dart';
import 'package:bangorder_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bangorder_mobile/ui/pages/pages.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => RestaurantServiceProvider()),
      ChangeNotifierProvider(create: (_) => MenuCategoryServiceProvider()),
      ChangeNotifierProvider(create: (_) => MenuServiceProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<RestaurantServiceProvider>(context, listen: false).init();
    Provider.of<MenuCategoryServiceProvider>(context, listen: false).init();
    Provider.of<MenuServiceProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bangorder',
      theme: ThemeData(
        primarySwatch: yellowColor,
      ),
      home: RestaurantHomePage(),
    );
  }
}

