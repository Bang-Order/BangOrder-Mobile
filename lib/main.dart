import 'package:bangorder_mobile/providers/providers.dart';
import 'package:bangorder_mobile/shared/shared.dart';
import 'package:bangorder_mobile/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantServiceProvider()),
        ChangeNotifierProvider(create: (_) => MenuCategoryServiceProvider()),
        ChangeNotifierProvider(create: (_) => MenuServiceProvider()),
        ChangeNotifierProvider(create: (_) => BarcodeProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => HomePageProvider(context)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bangorder',
        theme: ThemeData(
          primarySwatch: yellowColor,
        ),
        initialRoute: '/home',
        routes: {
          '/': (_) => LandingPage(),
          // '/home': (_) => HomePage(),
          '/home': (_) => OrderStatusPage(),
        },
      ),
    );
  }
}