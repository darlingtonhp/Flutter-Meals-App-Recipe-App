import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/cubit/filter_cubit.dart';
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
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        if (state is FilterInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FilterLoaded) {
          final categoryMeals = state.filteredMeals.where(
            (meal) {
              return meal.categories.contains(categoryId);
            },
          ).toList();
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
