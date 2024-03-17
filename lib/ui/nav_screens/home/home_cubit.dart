// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:midlr/database/models/analytics_model.dart';
// import 'package:midlr/dependency/navigation/navigator_routes.dart';
//
// import 'components/sales_analytics_dailog.dart';
// import 'home_service.dart';
//
// class HomeState {
//   BalanceSummary balanceSummary;
//
//   HomeState({required this.balanceSummary});
// }
//
// HomeState _reset = HomeState(balanceSummary: BalanceSummary.defaultBalances);
//
// class HomeCubit extends Cubit<HomeState> {
//   HomeServiceImp homeServiceImp;
//
//   HomeCubit({required this.homeServiceImp}) : super(_reset);
//
//   void _emitState() => emit(HomeState(balanceSummary: state.balanceSummary));
//
//   void resetState() => emit(_reset);
//
//   void getBalances() async {
//     await homeServiceImp.getBalances();
//   }
//
//   void showSalesPopUp() {
//     showGeneralDialog(
//         context: buildContext,
//         barrierColor: Colors.black45,
//         barrierLabel: 'Dialog',
//         barrierDismissible: false,
//         transitionDuration: const Duration(milliseconds: 400),
//         pageBuilder: (_, __, ___) => const SalesAnalyticsDialog());
//   }
// }
