import 'package:flutter/material.dart';
import 'package:make_qr/core/theme/app_colors.dart';

class Theming {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      fontFamily: 'Poppins',
      indicatorColor: primaryColor,
      primaryColor: primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey),
          )),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: primaryColor, selectionHandleColor: primaryColor));

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    fontFamily: 'Poppins',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      elevation: 0,
      backgroundColor: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey),
        )),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: primaryColor),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primaryColor, selectionHandleColor: primaryColor),
  );
}
