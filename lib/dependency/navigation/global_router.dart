
import 'global_router_exports.dart';

class GlobalRouter {
  GlobalRouter._();

  static generateRoutes(settings) {
    switch (settings.name) {
      case Routes.domain:
        // return MaterialPageRoute(
        //     settings: settings, builder: (_) => const Domain());

      case Routes.splashScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());

      case Routes.getStartedScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const GetStartedScreen());

      case Routes.signInScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignInScreen());
    }
  }
}
