part of '../pages.dart';

class HomepageLoadingScreen extends StatelessWidget {
  const HomepageLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
          baseColor: darkGrayColor,
          highlightColor: lightGrayColor,
          child: ListView.builder(itemCount: 10, itemBuilder: (_, __) {
            return Container(
              margin: EdgeInsets.all(16),
              height: 100,
              width: double.infinity,
              color: redColor,
            );
          })),
    );
  }
}
