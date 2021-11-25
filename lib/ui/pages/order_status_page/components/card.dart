part of '../../pages.dart';

class OrderStatusPageCardComponent extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String lottieURL;

  const OrderStatusPageCardComponent({
    Key? key,
    required this.title,
    required this.lottieURL,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: orderStatusTitleStyle,
          ),
          SizedBox(height: 32),
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Lottie.network(lottieURL)),
          if (subTitle != null) ...[
            SizedBox(height: 32),
            Text(
              subTitle!,
              style: orderStatusSubTitleStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
