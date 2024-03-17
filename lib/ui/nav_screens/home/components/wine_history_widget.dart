import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/ui/global_components/card_decoration.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/enumerations.dart';
import 'package:one_cask/utils/global_assets.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

class WineHistoryWidget extends StatelessWidget {
  const WineHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
              decoration: cardDecorationC(),
              width: deviceWidth(context),
              padding: EdgeInsets.all(spacingPadding4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(timeline),
                  globalGap(4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Label', style: regularText(color: kWhite)),
                        globalGap(2),
                        Text('Title',
                            style: mediumText(
                                color: kWhite,
                                fontType: ebGaramond,
                                fontSize: 22)),
                        globalGap(2),
                        Text(
                            'This is the classic ‘ahhh’ moment for most wine drinkers.',
                            style: regularText(color: kWhite)),
                        globalGap(2),
                        SvgPicture.asset(attachment)
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
