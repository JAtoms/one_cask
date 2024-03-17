import 'package:flutter/gestures.dart';
import 'package:one_cask/dependency/navigation/navigator_routes.dart';
import 'package:one_cask/ui/global_components/card_decoration.dart';
import 'package:one_cask/ui/global_components/global_button.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/enumerations.dart';
import 'package:one_cask/utils/global_assets.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

import '../../../dependency/navigation/global_router_exports.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryB,
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            bgnd,
            fit: BoxFit.cover,
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: spacingPadding4, vertical: spacingPadding5),
                margin: EdgeInsets.symmetric(
                    horizontal: spacingPadding5, vertical: spacingPadding10),
                decoration: cardDecorationA(),
                child: Column(
                  children: [
                    Text('Welcome',
                        style: regularText(
                            color: kWhite, fontSize: 32, fontType: ebGaramond)),
                    globalGap(2),
                    Text('Stepan Janacek',
                        style: regularText(
                            color: kWhite, fontSize: 16, fontType: ebGaramond)),
                    globalGap(10),
                    GlobalButton(btnText: 'Scan bottle', onTap: () => null),
                    globalGap(10),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Have an account?          ',
                          style: regularText(color: kWhite, fontSize: 16),
                          children: [
                            TextSpan(
                                text: 'Sign in first',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => globalNavigateTo(
                                      route: Routes.signInScreen),
                                style: regularText(
                                    color: kSecondaryColor,
                                    fontSize: 16,
                                    fontType: ebGaramond)),
                          ]),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
