import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/data_models/wine_detail_model.dart';
import 'package:one_cask/utils/enumerations.dart';

import 'home_service.dart';

class HomeState {
  TabType tabType;
  WineData? wineData;

  HomeState({required this.tabType, required this.wineData});
}

HomeState _reset = HomeState(tabType: TabType.details, wineData: null);

class HomeCubit extends Cubit<HomeState> {
  HomeServiceImp homeServiceImp;

  HomeCubit({required this.homeServiceImp}) : super(_reset);

  void _emitState() =>
      emit(HomeState(tabType: state.tabType, wineData: state.wineData));

  void resetState() => emit(_reset);

  void getWines() async {
    await homeServiceImp.getWines().then((value) {
      if (value != null) {
        state.wineData = value;
        _emitState();
      }
    });
  }

  void changeTab({required TabType tab}) {
    state.tabType = tab;
    _emitState();
  }
}
