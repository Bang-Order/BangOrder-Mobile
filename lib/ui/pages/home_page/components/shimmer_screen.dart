part of '../../pages.dart';

class HomePageLoadingScreen extends StatelessWidget {
  const HomePageLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ShimmerRestaurantInfo(),
            SizedBox(height: 8),
            ShimmerRecommendationSection(),
          ],
        ),
      ),
    );
  }
}
