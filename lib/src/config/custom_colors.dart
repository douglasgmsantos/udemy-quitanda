import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(139, 195, 74, 0.1),
  100: const Color.fromRGBO(139, 195, 74, 0.1),
  200: const Color.fromRGBO(139, 195, 74, 0.2),
  300: const Color.fromRGBO(139, 195, 74, 0.3),
  400: const Color.fromRGBO(139, 195, 74, 0.4),
  500: const Color.fromRGBO(139, 195, 74, 0.5),
  600: const Color.fromRGBO(139, 195, 74, 0.6),
  700: const Color.fromRGBO(139, 195, 74, 0.7),
  800: const Color.fromRGBO(139, 195, 74, 0.8),
  900: const Color.fromRGBO(139, 195, 74, 1),
};

abstract class CustomColors {
  static Color customContrastColors = Colors.red.shade700;

  static MaterialColor customSwatchColor =
      MaterialColor(0xff8BC34A, _swatchOpacity);
}
