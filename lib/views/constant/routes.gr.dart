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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../categories_meals_page.dart' as _i2;
import '../categories_page.dart' as _i1;
import '../meal_details_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CategoriesRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.CategoriesPage(),
      );
    },
    CategoryMealsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryMealsRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
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
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.MealDetailsPage(
          key: args.key,
          mealsId: args.mealsId,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          CategoriesRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          CategoryMealsRoute.name,
          path: '/category-meals-page',
        ),
        _i4.RouteConfig(
          MealDetailsRoute.name,
          path: '/meal-details-page',
        ),
      ];
}

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesRoute extends _i4.PageRouteInfo<void> {
  const CategoriesRoute()
      : super(
          CategoriesRoute.name,
          path: '/',
        );

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i2.CategoryMealsPage]
class CategoryMealsRoute extends _i4.PageRouteInfo<CategoryMealsRouteArgs> {
  CategoryMealsRoute({
    required String categoryId,
    required String categoryTitle,
    _i5.Key? key,
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

  final _i5.Key? key;

  @override
  String toString() {
    return 'CategoryMealsRouteArgs{categoryId: $categoryId, categoryTitle: $categoryTitle, key: $key}';
  }
}

/// generated route for
/// [_i3.MealDetailsPage]
class MealDetailsRoute extends _i4.PageRouteInfo<MealDetailsRouteArgs> {
  MealDetailsRoute({
    _i5.Key? key,
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

  final _i5.Key? key;

  final String mealsId;

  @override
  String toString() {
    return 'MealDetailsRouteArgs{key: $key, mealsId: $mealsId}';
  }
}
