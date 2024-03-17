import 'package:flutter/material.dart';
import 'package:one_cask/data_models/wine_detail_model.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/text_styles.dart';

class WineDetailWidget extends StatelessWidget {
  const WineDetailWidget({super.key, required this.details});

  final List<WineDetail> details;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: details.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: spacingPadding4),
              child: Row(
                children: [
                  Text(details[index].type, style: mediumText(color: kWhite)),
                  const Spacer(),
                  Text(details[index].value,
                      style: mediumText(color: kWhite.withAlpha(150)))
                ],
              ),
            ));
  }
}
