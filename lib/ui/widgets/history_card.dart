part of '_widgets.dart';

class HistoryCard extends StatelessWidget {
  final OrderHistory data;

  const HistoryCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.put(AfterOrderPageController()).goToPage(orderHistory: data);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin / 2,
        ),
        child: Row(
          children: [
            // Expanded(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(5),
            //     child: Image.network(data.ima!),
            //   ),
            // ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      // data.restaurantName,
                      data.id.toString(),
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: defaultMargin / 2),
                    Text(
                      data.orderStatus,
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: defaultMargin / 2),
                    Text(
                      data.createdAt,
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
