import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    backgroundColor: Colors.orange.shade100,
    primaryColor: Colors.yellow.shade300,
    primaryColorDark: Colors.red.shade100,
    secondaryHeaderColor: Colors.white,
    primaryColorLight: Colors.red,
    hintColor: Colors.black54,
  );
}

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    backgroundColor: Colors.grey.shade400,
    primaryColor: Colors.indigo.shade200,
    primaryColorDark: Color.fromARGB(255, 28, 42, 53),
    secondaryHeaderColor: Colors.grey.shade700,
    primaryColorLight: Colors.indigo.shade100,
    hintColor: Colors.white,
  );
}

ThemeData personalizedTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    backgroundColor: Colors.green.shade100,
    primaryColor: Colors.blue.shade100,
    primaryColorDark: Colors.amber.shade100,
    secondaryHeaderColor: Colors.white,
    primaryColorLight: Colors.green.shade600,
    hintColor: Colors.black54,
  );
}
