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
          nameCategory: args.nameCategory,
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
    required String nameCategory,
    List<PageRouteInfo>? children,
  }) : super(
          ListTovarRoute.name,
          args: ListTovarRouteArgs(
            key: key,
            categoryId: categoryId,
            nameCategory: nameCategory,
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
    required this.nameCategory,
  });

  final Key? key;

  final int categoryId;

  final String nameCategory;

  @override
  String toString() {
    return 'ListTovarRouteArgs{key: $key, categoryId: $categoryId, nameCategory: $nameCategory}';
  }
}
