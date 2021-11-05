part of '../../../pages/pages.dart';

class DetailMenuPageAddToBasketButton extends StatelessWidget {
  const DetailMenuPageAddToBasketButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailPageProvider>(
      builder: (context, provider, _) => Container(
        width: MediaQuery.of(context).size.width,
        child: provider.isUpdate && provider.menu.quantity == 0
            ? ElevatedButton(
                onPressed: () => provider.removeMenuInCart(context),
                child: Text(
                  'Hapus Pesanan',
                  style: deleteStyle,
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  primary: redColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              )
            : provider.isUpdate
                ? ElevatedButton(
                    onPressed: () => provider.updateMenuInCart(context),
                    child: Text(
                      'Tambahkan ke Keranjang - ' +
                          currency(provider.pricing()),
                      style: cartStyle,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => provider.addMenuToCart(context),
                    child: Text(
                      'Tambahkan ke Keranjang - ' +
                          currency(provider.pricing()),
                      style: cartStyle,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
      ),
    );
  }
}
