part of 'utils.dart';

launchURL(String url) async {
  // if (await canLaunch(url)) {
    await launch(url);
  // } else {
  //   throw 'Could not launch $url';
  // }
}
