import 'package:flutter/material.dart';
import 'package:meals_app/views/constant/routes.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
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
          primary: const Color(0XFF6649D0),
        ),
        scaffoldBackgroundColor: const Color(0XFF6649D0),
        canvasColor: const Color.fromRGBO(251, 251, 251, 1),
        fontFamily: 'CalligraphyFLF',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodySmall: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: Color.fromRGBO(20, 51, 51, 1),
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
