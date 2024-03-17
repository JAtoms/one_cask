import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/utils/colors.dart';

import 'dependency/get_it.dart';
import 'dependency/navigation/global_router.dart';
import 'dependency/navigation/global_routes.dart';
import 'dependency/navigation/navigation_service.dart';
import 'ui/auth/auth_cubit.dart';
import 'ui/nav_screens/home/home_cubit.dart';
import 'utils/size_config.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MultiBlocProvider(
              providers: [
                BlocProvider.value(value: getItInstance<AuthCubit>()),
                BlocProvider.value(value: getItInstance<HomeCubit>()),
              ],
              child: MaterialApp(
                  title: 'One Cask',
                  theme: ThemeData(
                    primarySwatch: materialPrimaryColor(),
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: kSecondaryColor),
                    useMaterial3: true,
                  ),
                  initialRoute: Routes.splashScreen,
                  navigatorKey:
                      getItInstance<NavigationServiceImpl>().navigationKey,
                  onGenerateRoute: (value) =>
                      GlobalRouter.generateRoutes(value)));
        });
      }),
    );
  }
}
