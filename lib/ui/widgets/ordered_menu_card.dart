part of 'widgets.dart';

class OrderedMenuCard extends StatelessWidget {
  final String quantity;
  final String menuName;
  final String? notes;
  final String price;

  const OrderedMenuCard({
    Key? key,
    required this.quantity,
    required this.menuName,
    this.notes,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      leading: Text(
        '${quantity}x',
        style: cartStyle,
      ),
      title: Text(
        menuName,
        style: menuTitleStyle,
      ),
      subtitle: notes != null
          ? Text(
              notes!,
              style: menuSubTitleStyle,
            )
          : null,
      trailing: Text(
        price,
        style: orderedMenuPriceStyle,
      ),
    );
  }
}
