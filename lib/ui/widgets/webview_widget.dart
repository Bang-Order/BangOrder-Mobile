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
            Get.off(HomePage());
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
