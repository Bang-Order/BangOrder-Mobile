part of '../pages.dart';

class RestaurantHomePage extends StatelessWidget {
  List<Text> _list = [
    Text('1'),
    Text('2'),
    Text('3'),
    Text('1'),
    Text('2'),
    Text('3'),
    Text('1'),
    Text('2'),
    Text('3'),
    Text('1'),
    Text('2'),
    Text('3'),
    Text('1'),
    Text('2'),
    Text('3'),
    Text('1'),
    Text('2'),
    Text('3'),
    Text('1'),
    Text('2'),
    Text('3'),
    Text('1'),
    Text('2'),
    Text('3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CafeSejenak'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            //restaurant
            //RecomendationMenu
            MenuList()
          ],
        ),
      ),
    );
  }
}
