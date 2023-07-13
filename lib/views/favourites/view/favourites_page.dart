import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/views/favourites/cubit/favourites_cubit.dart';

import '../../../widgets/meal_item.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FavouritesCubit>().state;
    if (state is FavouritesInitial) {
      return Center(
        child: Text(
          'You have no favourites yet - start adding some!',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    } else if (state is FavouritesLoaded) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: state.favouritedMeals[index].id,
            title: state.favouritedMeals[index].title,
            imageUrl: state.favouritedMeals[index].imageUrl,
            duration: state.favouritedMeals[index].duration,
            affordability: state.favouritedMeals[index].affordability,
            complexity: state.favouritedMeals[index].complexity,
          );
        },
        itemCount: state.favouritedMeals.length,
      );
    } else {
      return const Center(
        child: Text('Something went wrong'),
      );
    }
  }
}
