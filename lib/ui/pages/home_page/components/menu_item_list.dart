part of '../../pages.dart';

class MenuItemList extends StatelessWidget {
  final MenuCategory menuCategory;

  const MenuItemList({
    Key? key,
    required this.menuCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApiController());

    return GetBuilder(
      init: RestaurantController(),
      builder: (_) => controller.menu.data.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount:
                  controller.menu.getMenuByCategoryId(menuCategory).length,
              itemBuilder: (context, i) => MenuCard(
                data: controller.menu.getMenuByCategoryId(menuCategory)[i],
                context: context,
                prevPage: PageEnum.HomePage,
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: controller.menu.getMenuByCategoryId(menuCategory).length,
              itemBuilder: (_, i) => ShimmerMenuCard(),
            ),
    );
  }
}
