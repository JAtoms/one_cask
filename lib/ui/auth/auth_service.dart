import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency/navigation/global_router_exports.dart';
import '../../dependency/navigation/navigator_routes.dart';

abstract class AuthService {

  Future<void> login({
    required String password,
    required String phoneNumb,
  });

}

class AuthServiceImp extends AuthService {

  AuthServiceImp();

  @override
  Future<void> login({
    required String password,
    required String phoneNumb,
  }) async {

    // showLoaderDialog();


    // globalPop();

    globalNavigateTo(route: Routes.domain);
  }

}
