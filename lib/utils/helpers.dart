
import 'package:gap/gap.dart';
import 'package:one_cask/utils/size_config.dart';

Gap globalGap(double gap) => Gap(gap.heightAdjusted);


bool isValidEmail(String email) {
  bool emailValid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\'
  r's@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.'
  r'[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.'
  r')+[a-zA-Z]{2,}))$')
      .hasMatch(email);
  if (emailValid) {
    return true;
  } else {
    return false;
  }
}

