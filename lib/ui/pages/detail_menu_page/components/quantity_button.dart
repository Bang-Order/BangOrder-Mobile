part of '../../../pages/pages.dart';

class DetailMenuPageQuantityButton extends StatelessWidget {
  const DetailMenuPageQuantityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMenuPageController());

    return GetBuilder(
      init: DetailMenuPageController(),
      builder: (_) => Container(
        margin: EdgeInsets.all(defaultMargin),
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: darkGrayColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 39,
              height: 39,
              child: controller.isUpdate && controller.menu.quantity > 0
                  ? ElevatedButton(
                      onPressed: controller.decrementQuantity,
                      child: Icon(
                        Icons.remove_rounded,
                        color: Colors.white,
                        size: 39,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                      ),
                    )
                  : !controller.isUpdate && controller.menu.quantity > 1
                      ? ElevatedButton(
                          onPressed: controller.decrementQuantity,
                          child: Icon(
                            Icons.remove_rounded,
                            color: Colors.white,
                            size: 39,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: null,
                          child: Icon(
                            Icons.remove_rounded,
                            color: Colors.white,
                            size: 39,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            primary: lightGrayColor,
                          ),
                        ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                controller.menu.quantity.toString(),
                style: quantityStyle,
              ),
            ),
            Container(
              width: 39,
              height: 39,
              child: ElevatedButton(
                onPressed: controller.incrementQuantity,
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 39,
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
