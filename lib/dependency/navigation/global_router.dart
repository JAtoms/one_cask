import 'global_router_exports.dart';

class GlobalRouter {
  GlobalRouter._();

  static generateRoutes(settings) {
    switch (settings.name) {
      case Routes.domain:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Domain());

      case Routes.splashScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());

      case Routes.onBoardScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const OnboardScreen());

      case Routes.signInScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignInScreen());
    }
  }
}
