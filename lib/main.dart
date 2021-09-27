import 'package:bangorder_mobile/models/models.dart';
import 'package:bangorder_mobile/providers/providers.dart';
import 'package:bangorder_mobile/shared/shared.dart';
import 'package:bangorder_mobile/ui/pages.dart';
import 'package:flutter/material.dart';
import 'package:bangorder_mobile/models/models.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServicesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bangorder',
        theme: ThemeData(
          primarySwatch: yellowColor,
        ),
        // home: DetailMenuPage(new Menu(
        //   id: 1,
        //   restaurantId: 2,
        //   name: 'Nasi Goreng Sea Food Special',
        //   description: 'Nasi Goreng + Seafood + Telur',
        //   price: 25000,
        //   image: 'https://cdn1-production-images-kly.akamaized.net/uOdyfc7nVAxN3VnLlHiO7HSm8tk=/673x379/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3108566/original/079979700_1587487794-Sajiku_1.jpg',
        // )),
        home: RestaurantHomePage(),
      ),
    );
  }
}
