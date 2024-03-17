import 'dart:async';
import 'package:flutter/services.dart';

import 'package:one_cask/data_models/wine_detail_model.dart';

abstract class HomeService {
  Future<WineData?> getWines();
}

class HomeServiceImp extends HomeService {
  HomeServiceImp();

  @override
  Future<WineData?> getWines() async {
    Future.delayed(const Duration(seconds: 10));
    var data = await rootBundle.loadString('lib/data_models/wine.json');
    return wineDetailsModelFromJson(data).data;
  }
}
