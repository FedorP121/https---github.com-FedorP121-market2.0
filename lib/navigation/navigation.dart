import 'package:coin/features/view.dart';

import 'package:flutter/material.dart';

class MainNavigation {
  // стартовая страница
  final initialRoute = Navigation.categoryPage;

  // мапа страниц
  final routes = <String, Widget Function(BuildContext context)>{
    Navigation.categoryPage: (context) => const CategoryPage(),
    Navigation.listTovars: (context) => ListTovarPage(),
  };
}

abstract class Navigation {
  static const categoryPage = 'category/';
  static const listTovars = 'category/list_tovars';
}
