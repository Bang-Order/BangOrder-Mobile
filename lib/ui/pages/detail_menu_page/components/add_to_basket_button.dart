part of '../../../pages/_pages.dart';

class DetailMenuPageAddToBasketButton extends StatelessWidget {
  const DetailMenuPageAddToBasketButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMenuPageController());

    return GetBuilder(
      init: DetailMenuPageController(),
      builder: (_) => Container(
        width: MediaQuery.of(context).size.width,
        child: controller.isUpdate && controller.menu.quantity == 0
            ? ElevatedButton(
                onPressed: controller.removeMenuInCart,
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
            : controller.isUpdate
                ? ElevatedButton(
                    onPressed: controller.updateMenuInCart,
                    child: Text(
                      'Tambahkan ke Keranjang - ' +
                          currency(controller.pricing()),
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
                    onPressed: controller.addMenuToCart,
                    child: Text(
                      'Tambahkan ke Keranjang - ' +
                          currency(controller.pricing()),
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
