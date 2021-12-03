part of 'widgets.dart';

class ShimmerRecommendationCard extends StatelessWidget {
  const ShimmerRecommendationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Material(
      color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              period: Duration(seconds: 2),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                height: 100,
                margin: EdgeInsets.only(right: 15),
              ),
            ),
            SizedBox(height: defaultMargin / 2),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              period: Duration(seconds: 2),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                height: 10,
                margin: EdgeInsets.only(right: 70),
              ),
            ),
            SizedBox(height: defaultMargin / 2),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              period: Duration(seconds: 2),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                height: 10,
                margin: EdgeInsets.only(right: 90),
              ),
            ),
          ],
        ),
    );
  }
}
