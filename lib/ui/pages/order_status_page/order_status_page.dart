part of '../pages.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderStatusPageController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Status'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackColor,
          ),
          onPressed: controller.backOnClick,
        ),
      ),
      body: StreamBuilder(
        stream: controller.getReference.onValue,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (controller.isTrue(snapshot)) {
            switch (snapshot.data.snapshot.value) {
              case 'payment_pending':
                return OrderStatusPageCardComponent(
                  title: 'Belum Bayar',
                  lottieURL:
                      'https://assets1.lottiefiles.com/packages/lf20_yZpLO2.json',
                );
              case 'antri':
                return OrderStatusPageCardComponent(
                  title: 'Sedang Antri',
                  lottieURL:
                      'https://assets7.lottiefiles.com/packages/lf20_lcmpz7.json',
                  subTitle: 'Pesanan Anda masih berada dalam antrian masak.',
                );
              case 'dimasak':
                return OrderStatusPageCardComponent(
                  title: 'Sedang Dimasak',
                  lottieURL:
                      'https://assets7.lottiefiles.com/packages/lf20_jbt4j3ea.json',
                  subTitle: 'Pesanan Anda masih dimasak. Mohon tunggu sebentar',
                );
              case 'selesai':
                return OrderStatusPageCardComponent(
                  title: 'Sudah Diantar',
                  lottieURL:
                      'https://assets1.lottiefiles.com/private_files/lf30_fqBsFC.json',
                  subTitle: 'Pesanan Anda sudah diantar. Selamat menikmati!',
                );
              default:
                return SizedBox();
            }
          } else {
            return Center(child: Text("No data"));
          }
        },
      ),
    );
  }
}

// return controller.showPage(snapshot.data.snapshot.value);
