import 'package:flutter/material.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/ui/global_components/card_decoration.dart';
import 'package:one_cask/ui/global_components/global_button.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/enumerations.dart';
import 'package:one_cask/utils/global_assets.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

import '../components/bottle_header_widget.dart';
import '../components/bottle_info_widget.dart';
import '../components/tab_button_widget.dart';

class BottleDetailScreen extends StatefulWidget {
  const BottleDetailScreen({super.key, required this.bottleTag});

  final int bottleTag;

  @override
  State<BottleDetailScreen> createState() => _BottleDetailScreenState();
}

class _BottleDetailScreenState extends State<BottleDetailScreen> {
  @override
  void initState() {
    // context.read<HomeCubit>().getBalances();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            bgnd,
            fit: BoxFit.cover,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingPadding4),
            child: Column(
              children: [
                globalGap(15),
                const DetailHeaderWidget(),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      globalGap(5),
                      const BottleInfoWidget(),
                      globalGap(5),
                      Hero(
                          tag: widget.bottleTag,
                          child:
                              Image.asset(big_wine, height: spacingPadding60)),
                      globalGap(5),
                      Container(
                        decoration: cardDecorationB(),
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
                            TabButtonsWidget()
                          ],
                        ),
                      ),
                      globalGap(15),
                      const GlobalButton(btnText: '+ Add to my collection'),

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


