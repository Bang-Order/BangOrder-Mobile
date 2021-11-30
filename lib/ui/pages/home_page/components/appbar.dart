part of '../../pages.dart';

class HomepageAppbarComponent extends StatelessWidget {
  late bool innerBoxIsScrolled;

  HomepageAppbarComponent({
    Key? key,
    required this.innerBoxIsScrolled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.watch<RestaurantServiceProvider>();
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    return SliverAppBar(
      stretch: true,
      onStretchTrigger: () async {
        CallApi().callApi(context);
      },
      stretchTriggerOffset: 300,
      title: innerBoxIsScrolled
          ? Text(
              value.data.name,
              style: innerBoxIsScrolled
                  ? appbarTextStyle
                  : appbarScrolledTextStyle,
            )
          : null,
      leading: IconButton(
        padding: EdgeInsets.all(0),
        splashRadius: 20,
        icon: Icon(
          Icons.arrow_back_outlined,
          color: innerBoxIsScrolled ? blackColor : Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LandingPage(
                key: Key('LandingPage'),
              ),
            ),
            (route) => false,
          );
          // Navigator.popUntil(context, ModalRoute.withName('/'));
        },
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 4),
          child: IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: innerBoxIsScrolled ? blackColor : Colors.white,
            ),
            onPressed: () => showSearch(
              context: context,
              delegate: SearchPage<Menu>(
                items: Provider.of<MenuServiceProvider>(
                  context,
                  listen: false,
                ).data,
                builder: (t) => MenuCard(
                  data: t,
                  context: context,
                  prevPage: PageEnum.SearchPage,
                ),
                filter: (t) => [t.name],
              ),
            ),
          ),
        ),
      ],
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.zoomBackground,
        ],
        background: value.data.image.isNotEmpty
            ? Stack(
                fit: StackFit.expand,
                children: [
                  Consumer<RestaurantServiceProvider>(
                    builder: (BuildContext context, value, Widget? child) =>
                        Image.network(
                      value.data.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black87, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                      ),
                    ),
                  )
                ],
              )
            : Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.width -
                      AppBar().preferredSize.height,
                ),
              ),
      ),
      expandedHeight:
          MediaQuery.of(context).size.width - AppBar().preferredSize.height,
    );
  }
}
