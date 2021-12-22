part of '../_pages.dart';

class AfterOrderPage extends StatelessWidget {
  const AfterOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    final controller = Get.put(AfterOrderPageController());

    return StreamBuilder(
      stream: controller.getOrderStatus.onValue,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (controller.isTrue(snapshot)) {
          switch (snapshot.data.snapshot.value) {
            case 'payment_pending':
              return WebViewPage(
                backOnClick: () => Get.off(HomePage()),
                title: "Pembayaran",
                selectedUrl: controller.orderHistory.invoiceUrl!,
              );
            case 'antri':
              return OrderStatusPageView(
                title: 'Sedang Antri',
                lottieLocal: 'assets/images/antrian.json',
                subTitle: 'Pesanan Anda masih berada dalam antrian masak.',
                statusBarHeight: statusBarHeight,
              );
            case 'dimasak':
              return OrderStatusPageView(
                title: 'Sedang Dimasak',
                lottieURL:
                    'https://assets7.lottiefiles.com/packages/lf20_jbt4j3ea.json',
                subTitle: 'Pesanan Anda masih dimasak. Mohon tunggu sebentar',
                statusBarHeight: statusBarHeight,
              );
            case 'selesai':
              return OrderStatusPageView(
                title: 'Sudah Diantar',
                lottieURL:
                    'https://assets1.lottiefiles.com/private_files/lf30_fqBsFC.json',
                subTitle: 'Pesanan Anda sudah diantar. Selamat menikmati!',
                statusBarHeight: statusBarHeight,
              );
            default:
              return SizedBox();
          }
        } else {
          return OrderStatusPageView(
            title: 'Sudah Diantar',
            lottieURL:
                'https://assets1.lottiefiles.com/private_files/lf30_fqBsFC.json',
            subTitle: 'Pesanan Anda sudah diantar. Selamat menikmati!',
            statusBarHeight: statusBarHeight,
          );
        }
      },
    );
  }
}
