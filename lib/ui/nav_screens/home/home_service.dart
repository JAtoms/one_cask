// import 'dart:async';
// import 'dart:convert';
//
// import 'package:midlr/api_service/service.dart';
// import 'package:midlr/database/models/analytics_model.dart';
// import 'package:midlr/utils/helpers.dart';
//
// abstract class HomeService {
//   Future<BalanceSummary?> getBalances();
//
//   Future<void> getMonthlySales();
// }
//
// class HomeServiceImp extends HomeService {
//   ServiceHelpersImp serviceHelpersImp;
//
//   HomeServiceImp({required this.serviceHelpersImp});
//
//   @override
//   Future<BalanceSummary?> getBalances() async {
//     var response = await serviceHelpersImp.get(endPointUrl: '/balance/summary');
//     BalanceSummary? balanceSummary;
//
//     response.fold(
//         (left) => globaLog('Error: home_service/getBalances\n', left.error),
//         (right) {
//       if (right.statusCode == 200) {
//         // globaLog('right.data', jsonEncode(right.data));
//         balanceSummary = analyticsModelFromJson(right.data).summary;
//       }
//     });
//     return balanceSummary;
//   }
//
//   @override
//   Future<void> getMonthlySales() async {
//     // var response = await serviceHelpersImp.post(
//     //     endPointUrl: '/auth/customer/send/otp', body: body);
//     //
//     //
//     // response.fold((left) => globalToast('Sorry, an error occurred'), (right) {
//     //   if (right.statusCode == 200) {
//     //     globalToast(right.data['message']);
//     //     // globalNavigateUntil(route: Routes.login);
//     //   }
//     // });
//   }
// }
