import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/dependency/navigation/navigator_routes.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/global_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _fadeInEdenAnimatedLogoOut;

  void afterSplash() async {
    await Future.delayed(const Duration(milliseconds: 1200),
        () async => globalNavigateTo(route: Routes.getStarted));
  }

  @override
  void initState() {
    super.initState();

    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    _fadeInEdenAnimatedLogoOut =
        Tween<double>(begin: 0.0, end: 0.8).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) => afterSplash());
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: SvgPicture.asset(one_cask_logo)),
          Center(
            child: FadeTransition(
              opacity: _fadeInEdenAnimatedLogoOut,
              child: Center(
                child: SvgPicture.asset(
                  bgnd,
                  height: spacingPadding6,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
