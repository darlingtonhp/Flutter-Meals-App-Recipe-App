import 'package:auto_route/annotations.dart';
import 'package:meals_app/views/categories_page.dart';
import 'package:meals_app/views/favourites/view/favourites_page.dart';
import 'package:meals_app/views/filters_page.dart';
import 'package:meals_app/views/meal_details_page.dart';
import '../categories_meals_page.dart';
import '../tab_bar_page.dart';

// const tabBarPageRoute = '/tabBar/';
// const categoryMealsRoute = '/categoryMeals';
// const mealDetailsRoute = '/mealDetails';
// const categoriesPage = '/categories/';
// const favouritesRoute = '/favourites/';
// const filtersRoute = '/filters/';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: TabBarPage,
      initial: true,
      children: [
        AutoRoute(page: CategoriesPage),
        AutoRoute(page: FavouritesPage),
      ],
    ),
    AutoRoute(page: CategoryMealsPage),
    AutoRoute(page: MealDetailsPage),
    AutoRoute(page: FiltersPage),
  ],
)
class $AppRouter {}
