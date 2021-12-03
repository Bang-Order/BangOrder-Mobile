part of '../../_pages.dart';

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
      init: ApiController(),
      builder: (_) => ListView.builder(
        shrinkWrap: true,
        controller: ScrollController(),
        itemCount: controller.api.menuCategory.data.length,
        itemBuilder: (context, index) => _categoryHeader(
          controller.api.menuCategory.getMenuCategoryByIndex(index),
        ),
      ),
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
