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

    return ListView.separated(
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
      separatorBuilder: (context, index) => Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 6),
        child: DottedLine(
          direction: Axis.horizontal,
          lineLength: double.infinity,
          lineThickness: 1.5,
          dashLength: 4.0,
          dashColor: lightGrayColor,
          dashRadius: 0.0,
          dashGapLength: 0.0,
          dashGapColor: Colors.transparent,
        ),
      ),
    );
  }
}
