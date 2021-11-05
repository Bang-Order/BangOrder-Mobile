part of '../pages.dart';

class DetailMenuPage extends StatelessWidget {
  const DetailMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        final x = Provider.of<DetailPageProvider>(context, listen: false);
        return x.exit(context);
      },
      child: Scaffold(
        appBar: detailMenuPageAppbar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DetailMenuPageImage(key: Key('DetailMenuPageImage')),
              DetailMenuPageMenuInfo(key: Key('DetailMenuPageMenuInfo')),
              SizedBox(height: defaultMargin / 2),
              DetailMenuNote(key: Key('DetailMenuNote'))
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DetailMenuPageQuantityButton(
                key: Key('DetailMenuPageBottomNavBar'),
              ),
              DetailMenuPageAddToBasketButton(
                key: Key('DetailMenuPageAddToBasketButton'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
