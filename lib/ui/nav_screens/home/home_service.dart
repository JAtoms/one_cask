import 'dart:async';

abstract class HomeService {
  Future<void> getWines();
}

class HomeServiceImp extends HomeService {
  HomeServiceImp();

  @override
  Future<void> getWines() async {
    // var response = await serviceHelpersImp.post(
    //     endPointUrl: '/auth/customer/send/otp', body: body);
    //
    //
    // response.fold((left) => globalToast('Sorry, an error occurred'), (right) {
    //   if (right.statusCode == 200) {
    //     globalToast(right.data['message']);
    //     // globalNavigateUntil(route: Routes.login);
    //   }
    // });
  }
}
