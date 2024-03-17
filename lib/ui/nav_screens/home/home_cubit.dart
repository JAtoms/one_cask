import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/utils/enumerations.dart';

import 'home_service.dart';

class HomeState {
  TabType tabType;
  HomeState({required this.tabType});
}

HomeState _reset = HomeState(tabType: TabType.details);

class HomeCubit extends Cubit<HomeState> {
  HomeServiceImp homeServiceImp;

  HomeCubit({required this.homeServiceImp}) : super(_reset);

  void _emitState() => emit(HomeState(tabType: state.tabType));

  void resetState() => emit(_reset);

  void getWines() async {
    await homeServiceImp.getWines();
  }

  void changeTab({required TabType tab}) {
    state.tabType = tab;
    _emitState();
  }
}
