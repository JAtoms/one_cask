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
    //
    // var body = {'phone': phoneNumb, 'password': password};
    //
    // var response =
    //     await serviceHelpersImp.post(body: body, endPointUrl: '/auth/login');
    //
    // globalPop();
    //
    // response.fold((left) => globalToast('Sorry, an error occurred'), (right) {
    //   if (right.statusCode == 200) {
    //     tempDatabaseImpl.saveUserToken(
    //         token: right.data['data']['accessToken']);
    //     globalToast(right.data['message']);
    //     globalNavigateTo(route: Routes.domain);
    //   }
    // });
    // return doesUserExist;
  }

}
