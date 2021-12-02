part of '../../../pages/pages.dart';

class DetailMenuPageImage extends StatelessWidget {
  DetailMenuPageImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMenuPageController());

    return GetBuilder(
      init: DetailMenuPageController(),
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.35,
        child:
        Image.network(
          controller.menu.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
