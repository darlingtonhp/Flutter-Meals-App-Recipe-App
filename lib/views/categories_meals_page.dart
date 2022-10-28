import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/cubit/meal_cubit.dart';
import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  const CategoryMealsPage(
    this.categoryId,
    this.categoryTitle, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MealLoaded) {
          final categoryMeals = state.meals
              .where(
                (meal) => meal.categories.contains(categoryId),
              )
              .toList();
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(categoryTitle),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(
                  id: categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  affordability: categoryMeals[index].affordability,
                  complexity: categoryMeals[index].complexity,
                );
              },
              itemCount: categoryMeals.length,
            ),
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}
