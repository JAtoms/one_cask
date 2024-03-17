import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/global_assets.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

final pagePosition = ValueNotifier(1);

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: spacingPadding4, left: spacingPadding6, right: spacingPadding6),
      decoration: BoxDecoration(
        color: kPrimaryColor,

        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 13,
              blurRadius: 7,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomNavItem(itemName: 'Scan', index: 0, icon: scan),
          globalGap(10),
          BottomNavItem(itemName: 'Collection', index: 1, icon: collection),
          globalGap(10),
          BottomNavItem(itemName: 'Store', index: 2, icon: shop),
          globalGap(10),
          BottomNavItem(itemName: 'Settings', index: 3, icon: settings),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatefulWidget {
  final String icon;
  final String itemName;
  final int index;

  const BottomNavItem(
      {super.key,
      required this.icon,
      required this.itemName,
      required this.index});

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pagePosition,
        builder: (context, int value, child) {
          return GestureDetector(
            onTap: () => pagePosition.value = widget.index,
            child: Container(
              height: spacingPadding16,
              color: Colors.transparent,
              child: Column(
                children: [
                  SvgPicture.asset(widget.icon,
                      color: widget.index != value
                          ? kWhite.withAlpha(100)
                          : kSecondaryColor,
                      height: spacingPadding4),
                  globalGap(1.5),
                  Text(
                    widget.itemName,
                    style: regularText(
                        fontSize: 12,
                        color: widget.index == value
                            ? kSecondaryColor
                            : kWhite.withAlpha(100)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
