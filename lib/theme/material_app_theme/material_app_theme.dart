import 'package:flutter/material.dart';

const customColor = MaterialColor(
  0xFF90CAF9,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);

final theme = ThemeData(
  useMaterial3: false,
  // фон скафолда
  // scaffoldBackgroundColor: Colors.white,
  // тема дивайдера
  // dividerColor: Colors.yellow,
  // цвет аппбара
  primarySwatch: customColor,
  // тема listTile
  // listTileTheme: const ListTileThemeData(iconColor: Colors.red),
  // Темы текста
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
);
