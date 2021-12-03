part of '_widgets.dart';

class ShimmerMenuCard extends StatelessWidget {
  const ShimmerMenuCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    period: Duration(seconds: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                      height: 10,
                      margin: EdgeInsets.only(right: 90),
                    ),
                  ),
                  SizedBox(
                    height: defaultMargin / 2,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    period: Duration(seconds: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                      height: 10,
                      margin: EdgeInsets.only(right: 90),
                    ),
                  ),
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
                  SizedBox(
                    height: defaultMargin / 2,
                  ),
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
            ),
          ),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              period: Duration(seconds: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                height: 10,
                margin: EdgeInsets.only(right: 90),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
