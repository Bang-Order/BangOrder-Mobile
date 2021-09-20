part of '../pages.dart';

class HomepageLoadingScreen extends StatelessWidget {
  const HomepageLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
    );
  }
}
