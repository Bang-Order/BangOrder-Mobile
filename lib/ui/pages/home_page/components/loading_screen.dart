part of '../../pages.dart';

class HomepageLoadingScreen extends StatelessWidget {
  const HomepageLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 1.3,
      child: CircularProgressIndicator(),
    );
  }
}
