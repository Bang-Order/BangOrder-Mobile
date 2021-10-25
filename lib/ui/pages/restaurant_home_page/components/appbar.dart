part of '../../pages.dart';

class RHPAppbar extends StatelessWidget {
  const RHPAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top,
          color: yellowColor,
        ),
        Container(
          height: AppBar().preferredSize.height,
          color: yellowColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: blackColor,
                ),
                onPressed: () {},
              ),
              Consumer<RestaurantServiceProvider>(
                builder: (context, restaurant, _) => !restaurant.loading
                    ? Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: restaurant.data.name,
                            style: appbarTextStyle,
                          ),
                        ),
                      )
                    : Text(''),
              ),
              IconButton(
                icon: Icon(
                  Icons.search_rounded,
                  color: blackColor,
                ),
                onPressed: () {
                  print('tes');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
