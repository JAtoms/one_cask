import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/dependency/navigation/navigator_routes.dart';
import 'package:one_cask/ui/global_components/card_decoration.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/enumerations.dart';
import 'package:one_cask/utils/global_assets.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

class DetailHeaderWidget extends StatelessWidget {
  const DetailHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: spacingPadding3,
                vertical: spacingPadding2),
            color: kPrimaryB,
            child: Text('Genesis Collection',
                style: boldText(color: kWhite))),
        GestureDetector(
          onTap: () => globalPop(),
          child: Container(
              padding: EdgeInsets.all(spacingPadding2),
              decoration: const BoxDecoration(
                  color: kPrimaryB, shape: BoxShape.circle),
              child: const Icon(
                Icons.close_rounded,
                color: kWhite,
              )),
        ),
      ],
    );
  }
}
