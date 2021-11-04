part of '../../../pages/pages.dart';

class DetailMenuPageAddToBasketButton extends StatelessWidget {
  const DetailMenuPageAddToBasketButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailPageProvider>(
      builder: (context, provider, _) => Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Tambahkan ke Keranjang - ',
            style: cartStyle,
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
      ),
    );
  }
}
