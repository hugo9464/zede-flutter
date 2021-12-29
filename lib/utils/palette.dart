import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff57e589, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff4ece7b), //10%
      100: const Color(0xff46b76e), //20%
      200: const Color(0xff3da060), //30%
      300: const Color(0xff348952), //40%
      400: const Color(0xff2c7345), //50%
      500: const Color(0xff235c37), //60%
      600: const Color(0xff1a4529), //70%
      700: const Color(0xff112e1b), //80%
      800: const Color(0xff09170e), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
