import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_service.dart';

class AuthState {
  String password, email;

  AuthState({required this.email, required this.password});
}

var _reset = AuthState(password: '', email: '');

class AuthCubit extends Cubit<AuthState> {
  AuthServiceImp authServiceImp;

  AuthCubit({required this.authServiceImp}) : super(_reset);

  void resetState() => emit(_reset);

  void _emitState() =>
      emit(AuthState(password: state.password, email: state.email));

  void login() async =>
      authServiceImp.login(phoneNumb: state.email, password: state.password);

  void savePersonalInfo({
    String? email,
    String? password,
  }) {
    if (password != null) {
      state.password = password;
    } else if (email != null) {
      state.email = email;
    }
    _emitState();
  }
}
