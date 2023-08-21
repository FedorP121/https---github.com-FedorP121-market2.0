import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: false,
  // фон скафолда
  scaffoldBackgroundColor: Colors.white,
  // тема дивайдера
  dividerColor: Colors.yellow,
  // цвет аппбара
  primarySwatch: Colors.yellow,
  // тема listTile
  listTileTheme: const ListTileThemeData(iconColor: Colors.red),
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
