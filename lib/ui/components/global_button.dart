import 'package:flutter/material.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/size_config.dart';
import 'package:one_cask/utils/text_styles.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, this.btnText, this.onTap});

  final String? btnText;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: spacingPadding3),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(2.heightAdjusted),
        ),
        child: Text(
          btnText ?? '',
          style: semiBoldText(fontSize: 15, color: kPrimaryColor),
        ),
      ),
    );
  }
}
