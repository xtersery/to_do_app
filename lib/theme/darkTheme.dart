import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 78, 195, 245);
const background = Color.fromARGB(255, 24, 22, 29);

final darkTheme = ThemeData(
        iconTheme: const IconThemeData(
          size: 30.0,
          color: Colors.white,
          ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: getMaterialColor(primaryColor),
          backgroundColor: background,
          brightness: Brightness.dark,
          ),
        useMaterial3: true,
        textTheme: const TextTheme(
          labelSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, letterSpacing: -0.2),
          labelMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: -0.3)
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
        ),
        listTileTheme: const ListTileThemeData(
          minVerticalPadding: 20.0,
          titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3
          ),
        ),
      );


MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
}
