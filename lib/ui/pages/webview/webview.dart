part of '../pages.dart';

class WebViewPage extends StatelessWidget {
  final String title;
  final String selectedUrl;

  WebViewPage({
    required this.title,
    required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.close_rounded,
            color: blackColor,
          ),
          onPressed: () {
            // Navigator.popUntil(context, ModalRoute.withName('/home'));
            Get.offAll(OrderStatusPage());

            // Navigator.of(context).pushAndRemoveUntil(
            //   MaterialPageRoute(
            //     builder: (context) => HomePage(),
            //   ),
            //       (route) => route.isFirst,
            // );
            // Navigator.popUntil(context, (Route<dynamic> predicate) => predicate.isFirst);
          },
        ),
      ),
      body: WebView(
        initialUrl: selectedUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
