

import 'package:flutter/material.dart';

class PaperbackTheme {

  static const Color primaryRed = Color(0xFFFF6C6C);
  static const Color primaryGradientStart = Color(0xFFFF6C6C);
  static const Color primaryGradientEnd = Color(0xFFD65050);
  static const Color yellow = Color(0xFFFFF504);
  static const Color textSubtle = Color(0xFFF5F5F5);
  static const Color bgDark = Color(0xFF292731);
  static const Color bgDarker = Color(0xFF16151B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFFCEC6C6);

  static const ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryRed,
    onPrimary: white,
    secondary: yellow,
    onSecondary: bgDark,
    tertiary: textDark,
    onTertiary: white,
    error: Color(0xFFCF6679),
    onError: white,
    surface: bgDark,
    onSurface: white,
    outline: textDark,
    shadow: Color(0xFF000000),
    inverseSurface: white,
    onInverseSurface: bgDark,
    inversePrimary: primaryRed,
    surfaceContainerHighest: bgDark,
    onSurfaceVariant: textSubtle,
  );


  //Large
  static TextTheme get textTheme {
    return const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: primaryRed,
      ),

       //Medium
      displayMedium: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 28,
        color: white,
      ),

displaySmall: TextStyle(
  fontFamily: 'Newsreader',
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: Colors.black,
),



      bodyLarge: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: white,
      ),


      bodyMedium: TextStyle(
        fontFamily: 'Karla',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: white,
      ),

      bodySmall: TextStyle(
        fontFamily: 'Karla',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: primaryRed,
      ),

  

      titleLarge: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: primaryRed,
      ),
    );
  }



  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: bgDark,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: bgDark,
        foregroundColor: white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Newsreader',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: white,
        ),
      ),
    );
  }
  

}
