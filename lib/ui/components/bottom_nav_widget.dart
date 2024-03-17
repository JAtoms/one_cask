// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:midlr/utils/colors.dart';
// import 'package:midlr/utils/global_assets.dart';
// import 'package:midlr/utils/helpers.dart';
// import 'package:midlr/utils/size_config.dart';
// import 'package:midlr/utils/text_styles.dart';
//
// final pagePosition = ValueNotifier(0);
//
// class BottomNavWidget extends StatelessWidget {
//   const BottomNavWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//           top: 3.heightAdjusted,
//           left: 6.heightAdjusted,
//           right: 6.heightAdjusted),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 13,
//               blurRadius: 7,
//               offset: const Offset(0, 2))
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           BottomNavItem(itemName: 'Home', index: 0, icon: home),
//           globalGap(10),
//           BottomNavItem(itemName: 'Store', index: 1, icon: store),
//           globalGap(10),
//           BottomNavItem(itemName: 'Orders', index: 2, icon: order),
//           globalGap(10),
//           BottomNavItem(itemName: 'Profile', index: 3, icon: profile),
//         ],
//       ),
//     );
//   }
// }
//
// class BottomNavItem extends StatefulWidget {
//   final String icon;
//   final String itemName;
//   final int index;
//
//   const BottomNavItem(
//       {Key? key,
//       required this.icon,
//       required this.itemName,
//       required this.index})
//       : super(key: key);
//
//   @override
//   State<BottomNavItem> createState() => _BottomNavItemState();
// }
//
// class _BottomNavItemState extends State<BottomNavItem> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: pagePosition,
//         builder: (context, int value, child) {
//           return GestureDetector(
//             onTap: () => pagePosition.value = widget.index,
//             child: Container(
//               height: 12.heightAdjusted,
//               color: Colors.transparent,
//               child: Column(
//                 children: [
//                   SvgPicture.asset(widget.icon,
//                       color: widget.index != value ? null : kMidlrGreen,
//                       height: 4.5.heightAdjusted),
//                   globalGap(1.5),
//                   Text(
//                     widget.itemName,
//                     style: regularText(
//                         fontSize: 12,
//                         color: widget.index == value
//                             ? kMidlrGreen
//                             : Colors.black54.withAlpha(100)),
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
