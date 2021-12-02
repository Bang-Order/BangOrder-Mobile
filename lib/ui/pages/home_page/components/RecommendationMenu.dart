part of '../../pages.dart';

class HomepageRecommendationMenuComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return GetBuilder(
      init: HomePageController(),
      builder: (_) => controller.menu.data.isNotEmpty
          ? Container(
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
                      data: controller.menu.getRecommendationMenu[i],
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
            )
          : Container(
        color: Colors.white,
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              period: Duration(seconds: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 20,
                margin: EdgeInsets.only(right: 250),
              ),
            ),
            SizedBox(height: defaultMargin),
            GridView.builder(
              controller: ScrollController(),
              padding: EdgeInsets.symmetric(horizontal: 12),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (_, i) => ShimmerRecommendationCard(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 20,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
