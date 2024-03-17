import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/global_assets.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

class BottleInfoWidget extends StatelessWidget {
  const BottleInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: spacingPadding3, vertical: spacingPadding2),
        color: kPrimaryB,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(gear_icon),
            globalGap(4),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Genuine Bottle (Unopened)',
                      style: boldText(color: kWhite)),
                  const Spacer(),
                  SvgPicture.asset(chevron)
                ],
              ),
            ),
          ],
        ));
  }
}
