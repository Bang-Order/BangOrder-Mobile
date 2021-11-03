part of '../../../pages/pages.dart';

class DetailMenuPageImage extends StatelessWidget {
  DetailMenuPageImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailPageProvider>(
      builder: (context, provider, _) => Container(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Image.network(
          provider.menu.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
