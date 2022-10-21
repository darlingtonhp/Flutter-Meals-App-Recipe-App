import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/views/constants/routes.gr.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  ListTile buildListStyle(
      {required BuildContext context,
      required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: const Color(0XFFCD8B81),
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cooking Up',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0XFF30176A),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    buildListStyle(
                      context: context,
                      icon: Icons.restaurant,
                      text: 'Meals',
                      onTap: () {
                        context.router.push(const TabBarRoute());
                      },
                    ),
                    buildListStyle(
                      context: context,
                      icon: Icons.settings,
                      text: 'Settings',
                      onTap: () => context.router.push(const FiltersRoute()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
