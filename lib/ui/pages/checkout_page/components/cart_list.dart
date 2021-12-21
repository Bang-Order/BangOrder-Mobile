part of '../../../pages/_pages.dart';

class CheckoutPageCartListComponent extends StatelessWidget {
  const CheckoutPageCartListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutPageController());

    return GetBuilder(
      init: CartController(),
      builder: (_) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          shrinkWrap: true,
          controller: ScrollController(),
          itemBuilder: (context, index) => _customCard(
            controller.cart.items[index],
            context,
          ),
          separatorBuilder: (context, index) => Divider(
            height: 16,
            color: blackColor,
          ),
          itemCount: controller.cart.items.length,
        ),
      ),
    );
  }

  Widget _customCard(Menu data, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Text(
                data.quantity.toString() + "x",
                style: cartStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    data.name.toString(),
                    style: menuTitleStyle,
                  ),
                  SizedBox(height: 6),
                  if (data.notes.text != '')
                    Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        data.notes.text,
                        style: menuSubTitleStyle,
                      ),
                    ),
                  InkWell(
                    child: Text(
                      "Edit",
                      style: editTextCheckoutStyle,
                    ),
                    onTap: () =>
                        Get.put(DetailMenuPageController()).constructor(
                      menu: data,
                      previousPage: PageEnum.CheckoutPage,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                currency(double.parse(data.price) * data.quantity).toString(),
                style: menuTitleStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
