import 'package:flutter/material.dart';
import 'package:meals_app/models/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/views/constants/routes.gr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DummyData().mealsData;

  void _setFilters(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;
        _availableMeals = DummyData().mealsData.where((meal) {
          if (_filters['gluten']! && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactose']! && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan']! && !meal.isVegan) {
            return false;
          }
          if (_filters['vegetarian']! && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
      },
    );
  }

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0XFF200E62),
        ),
        scaffoldBackgroundColor: const Color(0XFF200E62),
        canvasColor: const Color.fromRGBO(251, 251, 251, 1),
        fontFamily: 'CalligraphyFLF',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Colors.white,
              ),
              bodySmall: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: Colors.white,
              ),
              titleLarge: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Amperzand',
                fontWeight: FontWeight.bold,
              ),
              titleMedium: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Amperzand',
              ),
              titleSmall: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Amperzand',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
