import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:one_cask/data_models/wine_detail_model.dart';
import 'package:one_cask/utils/enumerations.dart';

import 'home_service.dart';

class HomeState {
  TabType tabType;
  WineData? wineData;

  bool isInternetAvailable;

  HomeState(
      {required this.tabType,
      required this.wineData,
      required this.isInternetAvailable});
}

HomeState _reset = HomeState(
  tabType: TabType.details,
  wineData: null,
  isInternetAvailable: true,
);

class HomeCubit extends Cubit<HomeState> {
  HomeServiceImp homeServiceImp;

  HomeCubit({required this.homeServiceImp}) : super(_reset);

  void _emitState() => emit(HomeState(
        tabType: state.tabType,
        wineData: state.wineData,
        isInternetAvailable: state.isInternetAvailable,
      ));

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

  void checkInternet() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 5), () async {
        bool result = await InternetConnectionChecker().hasConnection;
        state.isInternetAvailable = result;
        _emitState();
        if (result) getWines();
      });
      checkInternet();
    });
  }
}
