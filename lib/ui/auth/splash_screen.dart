import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/dependency/navigation/navigator_routes.dart';
import 'package:one_cask/utils/colors.dart';
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
    await Future.delayed(const Duration(seconds: 4),
        () async => globalNavigateTo(route: Routes.getStartedScreen));
  }

  @override
  void initState() {
    super.initState();

    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
      backgroundColor: kPrimaryB,
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(bgnd)),
          Center(
            child: FadeTransition(
              opacity: _fadeInEdenAnimatedLogoOut,
              child: Center(
                child: Image.asset(
                  one_cask_logo,
                  height: spacingPadding20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
