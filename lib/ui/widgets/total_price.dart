part of 'widgets.dart';

class TotalPrice extends StatelessWidget {
  final String price;

  const TotalPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total',
            style: metodePembayaranStyle,
          ),
          Text(
            price,
            style: totalPriceOrder,
          ),
        ],
      ),
    );
  }
}
