import 'package:bangorder_mobile/providers/providers.dart';
import 'package:bangorder_mobile/shared/shared.dart';
import 'package:bangorder_mobile/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => RestaurantServiceProvider()),
      ChangeNotifierProvider(create: (_) => MenuCategoryServiceProvider()),
      ChangeNotifierProvider(create: (_) => MenuServiceProvider()),
      ChangeNotifierProvider(create: (_) => BarcodeProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
      ChangeNotifierProvider(create: (_) => DetailPageProvider()),
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bangorder',
      theme: ThemeData(
        primarySwatch: yellowColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => LandingPage(),
        '/home': (_) => RestaurantHomePage(),
      },
    );
  }
}
