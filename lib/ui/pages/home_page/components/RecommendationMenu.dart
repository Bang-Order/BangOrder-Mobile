part of '../../_pages.dart';

class HomepageRecommendationMenuComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return GetBuilder(
      init: ApiController(),
      builder: (_) => Container(
        color: Colors.white,
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rekomendasi',
              style: recommendationHeader,
            ),
            SizedBox(height: defaultMargin),
            GridView.builder(
              controller: ScrollController(),
              padding: EdgeInsets.symmetric(horizontal: 12),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, i) => RecommendationCard(
                data: controller.api.menu.getRecommendationMenu[i],
                context: context,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 20,
              ),
            ),
            SizedBox(height: defaultMargin),
          ],
        ),
      ),
    );
  }
}
