part of '../../pages.dart';

class HomepageMenuCategoryComponent extends StatefulWidget {
  const HomepageMenuCategoryComponent({Key? key}) : super(key: key);

  @override
  State<HomepageMenuCategoryComponent> createState() =>
      _HomepageMenuCategoryComponentState();
}

class _HomepageMenuCategoryComponentState
    extends State<HomepageMenuCategoryComponent> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return GetBuilder(
      init: HomePageController(),
      builder: (_) => controller.menuCategory.data.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: controller.menuCategory.data.length,
              itemBuilder: (context, index) => _categoryHeader(
                controller.menuCategory.getMenuCategoryByIndex(index),
              ),
            )
          : SizedBox(),
    );
  }

  Widget _categoryHeader(MenuCategory data) {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.only(
          bottom: defaultMargin / 2,
        ),
        iconColor: Colors.black,
        tilePadding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 0,
        ),
        title: Text(
          data.name,
          style: categoryHeaderStyle,
        ),
        children: [
          MenuItemList(
            menuCategory: data,
            key: ValueKey('MenuItemList'),
          )
        ],
      ),
    );
  }
}
