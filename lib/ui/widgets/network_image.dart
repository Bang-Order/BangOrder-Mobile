part of 'widgets.dart';

// class NetworkImageWidget extends StatelessWidget {
//   final double borderRadius;
//   final int isAvailable;
//   final String url;
//
//   const NetworkImageWidget({
//     Key? key,
//     required this.borderRadius,
//     required this.isAvailable,
//     required this.url,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(borderRadius),
//       child: isAvailable == 1
//           ? Image.network(
//               url,
//               fit: BoxFit.cover,
//               loadingBuilder: (context, child, loadingProgress) {
//                 final controller = Get.put(HomePageController());
//
//                 if (loadingProgress == null) {
//                   controller.isLoading = false;
//                   return child;
//                 } else {
//                   controller.isLoading = true;
//                   return SizedBox();
//                 }
//               },
//             )
//           : ColorFiltered(
//               colorFilter: ColorFilter.mode(
//                 Colors.black.withOpacity(0.5),
//                 BlendMode.dstATop,
//               ),
//               child: Image.network(
//                 url,
//                 fit: BoxFit.cover,
//               ),
//             ),
//     );
//   }
// }
