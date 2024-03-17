import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/ui/components/card_decoration.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/enumerations.dart';
import 'package:one_cask/utils/global_assets.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

import 'home_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // context.read<HomeCubit>().getBalances();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingPadding4),
        child: Column(
          children: [
            globalGap(18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My collection',
                    style: boldText(
                        color: kWhite, fontSize: 28, fontType: ebGaramond)),
                SvgPicture.asset(notificationBell)
              ],
            ),
            globalGap(2),
            Flexible(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: spacingPadding2,
                  crossAxisSpacing: spacingPadding2,
                  mainAxisExtent: 280,
                ),
                padding: EdgeInsets.zero,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: cardDecorationB(),
                    height: spacingPadding20,
                    padding: EdgeInsets.all(spacingPadding2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Image.asset(wine)),
                        globalGap(2),
                        Text('Springbank',
                            style: mediumText(
                                fontSize: 20,
                                color: Colors.white,
                                fontType: ebGaramond)),
                        Text('1992 #1234 ',
                            style: mediumText(
                                fontSize: 20,
                                color: Colors.white,
                                fontType: ebGaramond)),
                        Text('(112/158) ',
                            style:
                                regularText(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
