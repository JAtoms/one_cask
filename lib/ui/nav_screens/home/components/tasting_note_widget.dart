import 'package:flutter/material.dart';
import 'package:one_cask/data_models/wine_detail_model.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/ui/global_components/card_decoration.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/enumerations.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

class TastingNoteWidget extends StatelessWidget {
  const TastingNoteWidget({super.key, required this.tastingNotes});

  final TastingNotes tastingNotes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tasting notes',
            style: mediumText(
              color: kWhite,
              fontType: ebGaramond,
              fontSize: 22,
            )),
        Text('by ${tastingNotes.tastedBy}',
            style: mediumText(
              fontSize: 16,
              color: kWhite.withAlpha(150),
            )),
        globalGap(4),
        WineNoteWidget(title: 'Nose', subTitle: tastingNotes.nose),
        WineNoteWidget(title: 'Palate', subTitle: tastingNotes.palate),
        WineNoteWidget(title: 'Finish', subTitle: tastingNotes.finish),
        globalGap(1),
        Row(
          children: [
            Text('Your notes',
                style: mediumText(
                  color: kWhite,
                  fontType: ebGaramond,
                  fontSize: 22,
                )),
            const Spacer(),
            const Icon(Icons.arrow_back_rounded, color: kWhite)
          ],
        ),
        globalGap(4),
        WineNoteWidget(title: 'Nose', subTitle: tastingNotes.nose),
        WineNoteWidget(title: 'Palate', subTitle: tastingNotes.palate),
        WineNoteWidget(title: 'Finish', subTitle: tastingNotes.finish),
      ],
    );
  }
}

class WineNoteWidget extends StatelessWidget {
  const WineNoteWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecorationC(),
      width: double.infinity,
      padding: EdgeInsets.all(spacingPadding4),
      margin: EdgeInsets.only(bottom: spacingPadding4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: mediumText(
                  color: kWhite, fontType: ebGaramond, fontSize: 22)),
          globalGap(1),
          Text(subTitle, style: mediumText(color: kWhite))
        ],
      ),
    );
  }
}
