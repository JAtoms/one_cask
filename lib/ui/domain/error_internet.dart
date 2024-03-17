import 'package:flutter/material.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/global_assets.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/size_config.dart';
import 'package:one_cask/utils/text_styles.dart';
import 'package:open_settings/open_settings.dart';

class ErrorInternet extends StatelessWidget {
  const ErrorInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(network_error, height: spacingPadding60),
        globalGap(6),
        Text('Oops No Network Connection',
            style: boldText(fontSize: 16, color: kWhite)),
        globalGap(2),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.widthAdjusted),
          child: Text('You will need an internet to use this service',
              softWrap: true,
              textAlign: TextAlign.center,
              style: regularText(fontSize: 16, color: kWhite)),
        ),
        globalGap(4),
        GestureDetector(
          onTap: () => OpenSettings.openWIFISetting(),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: spacingPadding4, vertical: spacingPadding2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(spacingPadding10),
                color: kSecondaryColor),
            child: Text('Open internet settings',
                textAlign: TextAlign.center,
                style: regularText()),
          ),
        )
      ],
    );
  }
}
