import 'package:flutter/cupertino.dart';

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

extension StringExtensions on String {
  String get svg => 'assets/images/svg/$this.svg';

  String get png => 'assets/images/png/$this.png';

  String get lottie => 'assets/lottie/$this.json';

  int get wordsCount {
    var regExp = RegExp(r"\w+('\w+)?");
    return regExp.allMatches(this).length;
  }
}

extension FormValidator on GlobalKey<FormState> {
  bool get validate => currentState!.validate();
}
