import 'package:flutter/material.dart';
import 'package:one_cask/utils/colors.dart';

BoxDecoration cardDecorationA() {
  return const BoxDecoration(
    color: kWashedGreen,
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.029999999329447746),
          offset: Offset(0, 4),
          blurRadius: 30)
    ],
  );
}

BoxDecoration cardDecorationB() {
  return const BoxDecoration(
    color: kWashedGreen,
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.029999999329447746),
          offset: Offset(0, 4),
          blurRadius: 30)
    ],
  );
}
