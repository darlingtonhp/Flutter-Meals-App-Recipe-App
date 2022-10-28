import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/views/constants/routes.gr.dart';
import 'package:meals_app/views/cubit/favourites_cubit.dart';

import 'app/cubit/meal_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MealCubit()),
        BlocProvider(create: (context) => FavouritesCubit()),
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
