part of '../../_pages.dart';

class HomepageAppbarComponent extends StatelessWidget {
  late bool innerBoxIsScrolled;

  HomepageAppbarComponent({
    Key? key,
    required this.innerBoxIsScrolled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = AppBar().preferredSize.height;
    final controller = Get.put(HomePageController());

    return SliverAppBar(
      title: innerBoxIsScrolled
          ? Text(
              controller.api.restaurant.getData!.name,
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
        onPressed: controller.exit,
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
                items: controller.api.menu.data,
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
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              controller.api.restaurant.getData!.image,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black87, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
      expandedHeight: MediaQuery.of(context).size.width - statusBarHeight,
    );
  }
}
