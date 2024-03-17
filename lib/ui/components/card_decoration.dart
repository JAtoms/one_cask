import 'package:flutter/material.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/size_config.dart';

BoxDecoration cardDecorationA() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(2.heightAdjusted),
    color: kWashedGreen,
    boxShadow: const [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.029999999329447746),
          offset: Offset(0, 4),
          blurRadius: 30)
    ],
  );
}

BoxDecoration cardDecorationB() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(2.heightAdjusted),
    color: kWashedGreen,
    boxShadow: const [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.029999999329447746),
          offset: Offset(0, 4),
          blurRadius: 30)
    ],
  );
}
