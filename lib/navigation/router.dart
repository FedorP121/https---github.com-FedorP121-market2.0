import 'package:auto_route/auto_route.dart';
import 'package:coin/features/view.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // забираем названия CategoryRoute, ListTovarRoute
        // с новой сгенерированной страницы
        AutoRoute(page: CategoryRoute.page, path: '/'), // стартовая страница
        AutoRoute(page: ListTovarRoute.page),
      ];
}

// flutter packages pub run build_runner build   - команда для билда

// при отправки аргументов из одной страницы в другу страницу мы должны
// по новой сгенерировать part 'router.gr.dart'; , а перед этим сделать
// конструктор с полем в странице где мы хотим получить аргументы

/*
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoryPage(),
      );
    },
    ListTovarRoute.name: (routeData) {
      final args = routeData.argsAs<ListTovarRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ListTovarPage(
          key: args.key,
          categoryId: args.categoryId,
        ),
      );
    },
  };
}

/// generated route for
/// [CategoryPage]
class CategoryRoute extends PageRouteInfo<void> {
  const CategoryRoute({List<PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListTovarPage]
class ListTovarRoute extends PageRouteInfo<ListTovarRouteArgs> {
  ListTovarRoute({
    Key? key,
    required int categoryId,
    List<PageRouteInfo>? children,
  }) : super(
          ListTovarRoute.name,
          args: ListTovarRouteArgs(
            key: key,
            categoryId: categoryId,
          ),
          initialChildren: children,
        );

  static const String name = 'ListTovarRoute';

  static const PageInfo<ListTovarRouteArgs> page =
      PageInfo<ListTovarRouteArgs>(name);
}

class ListTovarRouteArgs {
  const ListTovarRouteArgs({
    this.key,
    required this.categoryId,
  });

  final Key? key;

  final int categoryId;

  @override
  String toString() {
    return 'ListTovarRouteArgs{key: $key, categoryId: $categoryId}';
  }
}
*/
