part of '_widgets.dart';

class WebViewPage extends StatelessWidget {
  final String title;
  final String selectedUrl;
  final Function backOnClick;

  WebViewPage({
    required this.title,
    required this.selectedUrl,
    required this.backOnClick,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Get.offAll(LandingPage());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: appbarTextStyle,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.close_rounded,
              color: blackColor,
            ),
            onPressed: () => Get.offAll(LandingPage()),
          ),
        ),
        body: WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
