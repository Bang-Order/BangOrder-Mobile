part of '../../pages.dart';

class HomepageMenuCategoryComponent extends StatefulWidget {
  const HomepageMenuCategoryComponent({Key? key}) : super(key: key);

  @override
  State<HomepageMenuCategoryComponent> createState() => _HomepageMenuCategoryComponentState();
}

class _HomepageMenuCategoryComponentState extends State<HomepageMenuCategoryComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuCategoryServiceProvider>(
      builder: (context, menuCategory, _) => !menuCategory.loading
          ? ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: menuCategory.data.length,
              itemBuilder: (context, index) =>
                  _categoryHeader(menuCategory.getMenuCategoryByIndex(index)),
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
