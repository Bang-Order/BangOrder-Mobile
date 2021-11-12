part of '../../pages.dart';

class SPSearchItemCard extends StatelessWidget {
  Menu _menu;

  SPSearchItemCard(this._menu);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _menu.isAvailable == 1
          ? () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DetailMenuPage(_menu)),
              // );
            }
          : null,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: _menu.isAvailable == 0
              ? ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                  child: Image.network(_menu.image),
                )
              : Image.network(_menu.image),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _menu.name,
              style: _menu.isAvailable == 1
                  ? recommendationTitle
                  : menuTitleTransparentStyle,
            ),
            SizedBox(height: 5),
            Text(
              currency(double.parse(_menu.price)),
              style: _menu.isAvailable == 1
                  ? recommendationPrice
                  : menuPriceTransparentStyle,
            ),
          ],
        ),
      ),
    );
  }
}
