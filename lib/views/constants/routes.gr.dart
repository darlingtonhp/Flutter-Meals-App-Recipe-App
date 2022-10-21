// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../categories_meals_page.dart' as _i2;
import '../categories_page.dart' as _i5;
import '../favourites_page.dart' as _i6;
import '../filters_page.dart' as _i4;
import '../meal_details_page.dart' as _i3;
import '../tab_bar_page.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    TabBarRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.TabBarPage(),
      );
    },
    CategoryMealsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryMealsRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.CategoryMealsPage(
          args.categoryId,
          args.categoryTitle,
          key: args.key,
        ),
      );
    },
    MealDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MealDetailsRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.MealDetailsPage(
          key: args.key,
          mealsId: args.mealsId,
        ),
      );
    },
    FiltersRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.FiltersPage(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CategoriesPage(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FavouritesPage(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          TabBarRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              CategoriesRoute.name,
              path: 'categories-page',
              parent: TabBarRoute.name,
            ),
            _i7.RouteConfig(
              FavouritesRoute.name,
              path: 'favourites-page',
              parent: TabBarRoute.name,
            ),
          ],
        ),
        _i7.RouteConfig(
          CategoryMealsRoute.name,
          path: '/category-meals-page',
        ),
        _i7.RouteConfig(
          MealDetailsRoute.name,
          path: '/meal-details-page',
        ),
        _i7.RouteConfig(
          FiltersRoute.name,
          path: '/filters-page',
        ),
      ];
}

/// generated route for
/// [_i1.TabBarPage]
class TabBarRoute extends _i7.PageRouteInfo<void> {
  const TabBarRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TabBarRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabBarRoute';
}

/// generated route for
/// [_i2.CategoryMealsPage]
class CategoryMealsRoute extends _i7.PageRouteInfo<CategoryMealsRouteArgs> {
  CategoryMealsRoute({
    required String categoryId,
    required String categoryTitle,
    _i8.Key? key,
  }) : super(
          CategoryMealsRoute.name,
          path: '/category-meals-page',
          args: CategoryMealsRouteArgs(
            categoryId: categoryId,
            categoryTitle: categoryTitle,
            key: key,
          ),
        );

  static const String name = 'CategoryMealsRoute';
}

class CategoryMealsRouteArgs {
  const CategoryMealsRouteArgs({
    required this.categoryId,
    required this.categoryTitle,
    this.key,
  });

  final String categoryId;

  final String categoryTitle;

  final _i8.Key? key;

  @override
  String toString() {
    return 'CategoryMealsRouteArgs{categoryId: $categoryId, categoryTitle: $categoryTitle, key: $key}';
  }
}

/// generated route for
/// [_i3.MealDetailsPage]
class MealDetailsRoute extends _i7.PageRouteInfo<MealDetailsRouteArgs> {
  MealDetailsRoute({
    _i8.Key? key,
    required String mealsId,
  }) : super(
          MealDetailsRoute.name,
          path: '/meal-details-page',
          args: MealDetailsRouteArgs(
            key: key,
            mealsId: mealsId,
          ),
        );

  static const String name = 'MealDetailsRoute';
}

class MealDetailsRouteArgs {
  const MealDetailsRouteArgs({
    this.key,
    required this.mealsId,
  });

  final _i8.Key? key;

  final String mealsId;

  @override
  String toString() {
    return 'MealDetailsRouteArgs{key: $key, mealsId: $mealsId}';
  }
}

/// generated route for
/// [_i4.FiltersPage]
class FiltersRoute extends _i7.PageRouteInfo<void> {
  const FiltersRoute()
      : super(
          FiltersRoute.name,
          path: '/filters-page',
        );

  static const String name = 'FiltersRoute';
}

/// generated route for
/// [_i5.CategoriesPage]
class CategoriesRoute extends _i7.PageRouteInfo<void> {
  const CategoriesRoute()
      : super(
          CategoriesRoute.name,
          path: 'categories-page',
        );

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i6.FavouritesPage]
class FavouritesRoute extends _i7.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourites-page',
        );

  static const String name = 'FavouritesRoute';
}
