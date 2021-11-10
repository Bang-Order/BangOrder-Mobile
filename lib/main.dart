import 'package:bangorder_mobile/helpers/helpers.dart';
import 'package:bangorder_mobile/providers/providers.dart';
import 'package:bangorder_mobile/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:bangorder_mobile/ui/pages/pages.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final database = openDatabase(
  //   join(await getDatabasesPath(), 'order_history.db'),
  //   onCreate: (db, version) {
  //     return db.execute(
  //       'CREATE TABLE history(id INTEGER PRIMARY KEY, tableId INTEGER, transactionId TEXT, invoiceUrl TEXT, orderStatus TEXT, totalPrice TEXT)',
  //     );
  //   },
  //   version: 1,
  // );
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
    // TODO: implement initState
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
      home: LandingPage(),
    );
  }
}
