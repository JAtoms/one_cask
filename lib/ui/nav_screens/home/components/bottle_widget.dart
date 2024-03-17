import 'package:flutter/material.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/ui/global_components/card_decoration.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/enumerations.dart';
import 'package:one_cask/utils/global_assets.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

class BottleWidget extends StatelessWidget {
  const BottleWidget({super.key, required this.bottleTag});

  final int bottleTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecorationB(),
      padding: EdgeInsets.all(spacingPadding2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Hero(tag: bottleTag, child: Image.asset(wine))),
          globalGap(2),
          Text('Springbank',
              style: mediumText(
                  fontSize: 20, color: Colors.white, fontType: ebGaramond)),
          Text('1992 #1234 ',
              style: mediumText(
                  fontSize: 20, color: Colors.white, fontType: ebGaramond)),
          Text('(112/158) ',
              style: regularText(
                  fontSize: 12, color: Colors.white.withAlpha(150))),
        ],
      ),
    );
  }
}
