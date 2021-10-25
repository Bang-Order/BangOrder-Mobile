part of '../pages.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Metode Pembayaran",
          style: appbarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
          shrinkWrap: true,
          controller: ScrollController(),
          itemBuilder: (context, index) {
            return _customListPayment(context);
          },
          separatorBuilder: (context, index) => Divider(
                height: 10,
                color: lightGrayColor,
              ),
          itemCount: 5),
    );
  }

  Widget _customListPayment(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            child: Image.network(
                "https://1.bp.blogspot.com/-EmJLucvvYZw/X0Gm1J37spI/AAAAAAAAC0s/Dyq4-ko9Eecvg0ostmowa2RToXZITkbcQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Logo%2BShopeePay.png",
                fit: BoxFit.cover),
          ),
          Text("ShopeePay", style: metodePembayaranStyle,),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: blackColor,
              ))
        ],
      ),
    );
  }
}
