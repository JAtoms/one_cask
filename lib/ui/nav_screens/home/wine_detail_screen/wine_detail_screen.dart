import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/ui/global_components/card_decoration.dart';
import 'package:one_cask/ui/global_components/global_button.dart';
import 'package:one_cask/ui/nav_screens/home/components/wine_history_widget.dart';
import 'package:one_cask/ui/nav_screens/home/home_cubit.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/enumerations.dart';
import 'package:one_cask/utils/global_assets.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

import '../components/bottle_header_widget.dart';
import '../components/bottle_info_widget.dart';
import '../components/tab_button_widget.dart';
import '../components/tasting_note_widget.dart';
import '../components/wine_detail_widget.dart';

class WineDetailScreen extends StatefulWidget {
  const WineDetailScreen({super.key, required this.bottleTag});

  final int bottleTag;

  @override
  State<WineDetailScreen> createState() => _WineDetailScreenState();
}

class _WineDetailScreenState extends State<WineDetailScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getWines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kPrimaryColor,
          body: Stack(
            children: [
              Positioned.fill(child: Image.asset(bgnd, fit: BoxFit.cover)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacingPadding4),
                child: Column(
                  children: [
                    globalGap(15),
                    const DetailHeaderWidget(),
                    Flexible(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            globalGap(5),
                            const BottleInfoWidget(),
                            globalGap(5),
                            Hero(
                                tag: widget.bottleTag,
                                child: Image.asset(big_wine,
                                    height: spacingPadding60)),
                            globalGap(5),
                            Container(
                              decoration: cardDecorationA(),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: spacingPadding3,
                                  horizontal: spacingPadding3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bottle 135/184',
                                      style: regularText(
                                          fontSize: 12,
                                          color: Colors.white.withAlpha(150))),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text: 'Talisker ',
                                        style: regularText(
                                            color: kWhite,
                                            fontSize: 32,
                                            fontType: ebGaramond),
                                        children: [
                                          TextSpan(
                                              text: '18 Year old',
                                              style: regularText(
                                                  color: kSecondaryColor,
                                                  fontSize: 32,
                                                  fontType: ebGaramond)),
                                        ]),
                                  ),
                                  Text('#2504',
                                      style: regularText(
                                          fontSize: 32,
                                          fontType: ebGaramond,
                                          color: kWhite)),
                                  globalGap(5),
                                  const TabButtonsWidget(),
                                  globalGap(5),
                                  if (state.wineData != null) ...[
                                    if (state.tabType == details)
                                      WineDetailWidget(
                                          details: state.wineData!.details),
                                    if (state.tabType == tasting)
                                      TastingNoteWidget(
                                          tastingNotes:
                                              state.wineData!.tastingNotes),
                                    if (state.tabType == history)
                                      const WineHistoryWidget(),
                                  ]
                                ],
                              ),
                            ),
                            globalGap(8),
                            const GlobalButton(
                                btnText: '+ Add to my collection'),
                            globalGap(4)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
