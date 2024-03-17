import 'package:flutter/material.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/size_config.dart';
import 'package:one_cask/utils/text_styles.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton(
      {super.key,
      this.btnText,
      this.height,
      this.width,
      this.padding,
      this.child,
      this.onTap});

  final String? btnText;
  final Widget? child;
  final double? height, width;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        padding: padding ?? EdgeInsets.symmetric(vertical: 2.5.heightAdjusted),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(2.heightAdjusted),
        ),
        child: child ??
            Text(
              btnText ?? '',
              style: semiBoldText(fontSize: 15, color: kPrimaryColor),
            ),
      ),
    );
  }
}
