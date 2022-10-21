import 'package:flutter/material.dart';
import 'package:meals_app/models/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';

DummyData dummyData = DummyData();

class CategoriesPage extends StatelessWidget {
  static const String name = 'CategoriesViewRoute';
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
      ),
      children: dummyData.categoriesData
          .map(
            (catData) => CategoryItem(
              title: catData.title,
              color: catData.color,
              id: catData.id,
            ),
          )
          .toList(),
    );
  }
}
