part of '../../pages.dart';

class MenuItemList extends StatelessWidget {
  MenuCategory menuCategory;

  MenuItemList({Key? key, required this.menuCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuServiceProvider>(
      builder: (context, menu, _) => !menu.loading
          ? ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: menu.getMenuByCategoryId(menuCategory).length,
              itemBuilder: (context, i) => MenuCard(
                data: menu.getMenuByCategoryId(menuCategory)[i],
                context: context,
                prevPage: PageEnum.HomePage,
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: menu.getMenuByCategoryId(menuCategory).length,
              itemBuilder: (_, i) => ShimmerMenuCard(),
            ),
    );
  }
}
