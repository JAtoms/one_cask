import 'package:get_it/get_it.dart';
import 'package:one_cask/ui/auth/auth_cubit.dart';
import 'package:one_cask/ui/auth/auth_service.dart';
import 'navigation/navigation_service.dart';

final getItInstance = GetIt.I;

Future initDependencies() async {

  // Services
  getItInstance.registerLazySingleton<NavigationServiceImpl>(
      () => NavigationServiceImpl());

  getItInstance.registerLazySingleton<AuthServiceImp>(() => AuthServiceImp());

  // getItInstance.registerLazySingleton<HomeServiceImp>(
  //     () => HomeServiceImp(serviceHelpersImp: getItInstance()));

  // Cubits
  getItInstance
      .registerFactory(() => AuthCubit(authServiceImp: getItInstance()));

  // getItInstance
  //     .registerFactory(() => HomeCubit(homeServiceImp: getItInstance()));
}
