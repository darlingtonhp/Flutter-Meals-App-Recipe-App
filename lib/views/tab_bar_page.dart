import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/views/constants/routes.gr.dart';

import '../widgets/main_drawer.dart';

class TabBarPage extends StatefulWidget {
  static const String name = 'TabBarRoute';
  const TabBarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  // final List<Map<String, Object>> _pages = const [
  //   {'page': CategoriesPage(), 'title': 'Categories'},
  //   {'page': FavouritesPage(), 'title': 'Favourites'},
  // ];
  // int _pageIndex = 0;

  // void _selectedPage(int index) {
  //   setState(() {
  //     _pageIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        CategoriesRoute(),
        FavouritesRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(context.topRoute.name),
          ),
          drawer: const MainDrawer(),
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            unselectedItemColor: const Color(0XFF5A16AD),
            selectedItemColor: const Color(0XFFE59985),
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favourites',
              ),
            ],
          ),
        );
      },
    );
  }
}


// Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           _pages[_pageIndex]['title'] as String,
//         ),
//       ),
//       drawer: const MainDrawer(),
//       body: _pages[_pageIndex]['page'] as Widget,
//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 0,
//         selectedLabelStyle: const TextStyle(
//           fontFamily: 'Calligraphy',
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//         unselectedLabelStyle: const TextStyle(
//           fontFamily: 'Calligraphy',
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//         onTap: _selectedPage,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         unselectedItemColor: const Color(0XFF5A16AD),
//         selectedItemColor: const Color(0XFFE59985),
//         currentIndex: _pageIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.category,
//             ),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.favorite,
//             ),
//             label: 'Favourites',
//           ),
//         ],
//       ),
//     );