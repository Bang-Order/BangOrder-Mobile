part of '../../_pages.dart';

class MenuItemList extends StatelessWidget {
  final MenuCategory? menuCategory;

  const MenuItemList({
    Key? key,
    this.menuCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApiController());

    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      controller: ScrollController(),
      itemCount: menuCategory != null
          ? controller.menu.getMenuByCategoryId(menuCategory!).length
          : controller.menu.getMenuByNullMenuCategory().length,
      itemBuilder: (context, i) => MenuCard(
        data: menuCategory != null
            ? controller.menu.getMenuByCategoryId(menuCategory!)[i]
            : controller.menu.getMenuByNullMenuCategory()[i],
        context: context,
        prevPage: PageEnum.HomePage,
      ),
    );
  }
}
