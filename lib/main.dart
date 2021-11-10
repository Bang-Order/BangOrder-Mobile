import 'dart:async';

import 'package:bangorder_mobile/providers/providers.dart';
import 'package:bangorder_mobile/shared/shared.dart';
import 'package:bangorder_mobile/ui/pages/pages.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
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
    // initDynamicsLink(context);
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
      routes: {'/': (_) => LandingPage(), '/home': (context) => RestaurantHomePage()},
      // home: LandingPage(),
    );
  }
}

// Future<void> initDynamicsLink(BuildContext context) async {
//   FirebaseDynamicLinks.instance.onLink(
//       onSuccess: (PendingDynamicLinkData? dynamicLink) async {
//         final Uri? deeplink = dynamicLink!.link;
//
//         if (deeplink != null) {
//           print("deeplink data if satu : " + deeplink.toString());
//         } else {
//           print("deeplink data : null");
//         }
//       }, onError: (OnLinkErrorException e) async {
//     print('onLinkError');
//     print(e.message);
//   });
//
//   final PendingDynamicLinkData? data =
//   await FirebaseDynamicLinks.instance.getInitialLink();
//   final Uri? deepLink = data?.link;
//
//   if (deepLink != null) {
//     print("deeplink data if dua : " + deepLink.toString());
//     print(
//         "query param satu : " + deepLink.queryParameters.values.elementAt(0));
//     print("query param dua : " + deepLink.queryParameters.values.last);
//     print("deeplink path : " + deepLink.path);
//     // Get.toNamed(deepLink.queryParameters.values.toString());
//     // Navigator.pushNamed(context, deepLink.path);
//     // Navigator.of(context).pushNamed('/home');
//     // Navigator.pushNamed(context, '/home', arguments: deepLink.queryParameters.values.last);
//   }
// }
