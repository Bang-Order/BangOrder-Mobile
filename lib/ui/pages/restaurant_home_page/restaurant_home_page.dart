part of '../pages.dart';

class RestaurantHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrayColor,
      appBar: AppBar(
        title: Consumer<RestaurantServiceProvider>(
          builder: (context, restaurant, _) => !restaurant.loading
              ? Text(
            restaurant.data.name,
            style: appbarTextStyle,
          )
              : Text(''),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackColor,
          ),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 4),
            child: IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: blackColor,
              ),
              onPressed: () => showSearch(
                context: context,
                delegate: DataSearch(
                  // onQueryUpdate: (s) => print(s),
                  // items: people,
                  // searchLabel: 'Search people',
                  // suggestion: Center(
                  //   child: Text('Filter people by name, surname or age'),
                  // ),
                  // failure: Center(
                  //   child: Text('No person found :('),
                  // ),
                  // filter: (person) => [
                  //   person.name,
                  //   person.surname,
                  //   person.age.toString(),
                  // ],
                  // builder: (person) => ListTile(
                  //   title: Text(person.name),
                  //   subtitle: Text(person.surname),
                  //   trailing: Text('${person.age} yo'),
                  // ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // RHPAppbar(),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  RestaurantInfo(),
                  SizedBox(height: 8),
                  RecommendationMenu(),
                  SizedBox(height: 8),
                  RHPCategoryHeaderList(),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RHPFabCheckout(),
    );
  }
}
