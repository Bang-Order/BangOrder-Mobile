part of '../../_pages.dart';

class HomepageMenuCategoryComponent extends StatelessWidget {
  const HomepageMenuCategoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return GetBuilder(
      init: ApiController(),
      builder: (_) => ListView.builder(
        padding: EdgeInsets.symmetric(vertical: defaultMargin / 2),
        shrinkWrap: true,
        controller: ScrollController(),
        itemCount: controller.getMenuCategoryItemCount(),
        itemBuilder: (context, index) => index !=
                controller.getMenuCategoryItemCount() - 1
            ? _categoryHeader(
                data: controller.api.menuCategory.getMenuCategoryByIndex(index),
              )
            : _categoryHeader(),
      ),
    );
  }

  Widget _categoryHeader({MenuCategory? data}) {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // childrenPadding: EdgeInsets.only(
        //   bottom: defaultMargin / 2,
        // ),
        iconColor: Colors.black,
        tilePadding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 0,
        ),
        title: Text(
          data != null ? data.name : 'Lainnya',
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
