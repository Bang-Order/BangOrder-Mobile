part of '_widgets.dart';

class HistoryCard extends StatelessWidget {
  final OrderHistory data;

  const HistoryCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderHistoryPageController());

    return Slidable(
      key: ValueKey(data.id),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          controller.deleteHistory(data.id);
        }),
        children: [
          SlidableAction(
            onPressed: (context) {
              controller.deleteHistory(data.id);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Get.put(AfterOrderPageController()).goToPage(orderHistory: data);
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: defaultMargin / 2,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    data.imageUrl,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.only(left: 8),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin / 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.restaurantName,
                        style: orderedMenuPriceStyle,
                      ),
                      SizedBox(height: defaultMargin / 2),
                      if (data.orderItems.length == 1) ...[
                        Text(
                          data.orderItems[0].name,
                          style: menuSubTitleStyle,
                        ),
                      ] else ...[
                        Text(
                          data.orderItems[0].name +
                              " dan " +
                              (data.orderItems.length - 1).toString() +
                              " lainnya",
                          style: menuSubTitleStyle,
                          maxLines: 3,
                        ),
                      ],
                      SizedBox(height: defaultMargin / 2),
                      Text(
                        data.createdAt,
                        style: menuSubTitleStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topRight,
                  color: Colors.transparent,
                  margin: EdgeInsets.only(left: 8, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Rp " + data.totalPrice,
                        style: menuPriceStyle,
                      ),
                      SizedBox(height: defaultMargin / 2),
                      if (data.paymentMethod != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                controller.decisionLogoPaymentMethod(
                                    data.paymentMethod!),
                                height: 24,
                                width: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              data.paymentMethod!,
                              style: menuSubTitleStyle,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return InkWell(
    //   onTap: () {
    //     Get.put(AfterOrderPageController()).goToPage(orderHistory: data);
    //   },
    //   child: Container(
    //     color: Colors.transparent,
    //     padding: EdgeInsets.symmetric(
    //       horizontal: defaultMargin,
    //       vertical: defaultMargin / 2,
    //     ),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisSize: MainAxisSize.max,
    //       children: [
    //         Expanded(
    //           flex: 2,
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(5),
    //             child: Image.network(
    //               data.imageUrl,
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           flex: 5,
    //           child: Container(
    //             color: Colors.transparent,
    //             margin: EdgeInsets.only(left: 8),
    //             padding: EdgeInsets.symmetric(
    //               horizontal: defaultMargin / 2,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   // data.restaurantName,
    //                   data.restaurantName,
    //                   style: orderedMenuPriceStyle,
    //                 ),
    //                 SizedBox(height: defaultMargin / 2),
    //                 if (data.orderItems.length == 1) ...[
    //                   Text(
    //                     data.orderItems[0].name,
    //                     style: menuSubTitleStyle,
    //                   ),
    //                 ] else ...[
    //                   Text(
    //                     data.orderItems[0].name +
    //                         " dan " +
    //                         (data.orderItems.length - 1).toString() +
    //                         " lainnya",
    //                     style: menuSubTitleStyle,
    //                     maxLines: 3,
    //                   ),
    //                 ],
    //                 SizedBox(height: defaultMargin / 2),
    //                 Text(
    //                   data.createdAt,
    //                   style: menuSubTitleStyle,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           flex: 3,
    //           child: Container(
    //             alignment: Alignment.topCenter,
    //             color: Colors.transparent,
    //             margin: EdgeInsets.only(left: 8),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   "Rp " + data.totalPrice,
    //                   style: menuPriceStyle,
    //                 ),
    //                 SizedBox(height: defaultMargin / 2),
    //                 if (data.paymentMethod != null)
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     children: [
    //                       ClipRRect(
    //                         borderRadius: BorderRadius.circular(5),
    //                         child: Image.asset(
    //                           controller.decisionLogoPaymentMethod(
    //                               data.paymentMethod!),
    //                           height: 24,
    //                           width: 24,
    //                           fit: BoxFit.cover,
    //                         ),
    //                       ),
    //                       SizedBox(width: 4,),
    //                       Text(
    //                         data.paymentMethod!,
    //                         style: menuSubTitleStyle,
    //                       ),
    //                     ],
    //                   ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
