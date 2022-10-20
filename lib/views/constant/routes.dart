import 'package:auto_route/annotations.dart';
import 'package:meals_app/views/categories_page.dart';
import 'package:meals_app/views/meal_details_page.dart';
import '../categories_meals_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: CategoriesPage, initial: true),
    AutoRoute(page: CategoryMealsPage),
    AutoRoute(page: MealDetailsPage),
  ],
)
// extend the generated private router
class $AppRouter {}
