import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/views/cubit/favourites_cubit.dart';

import '../widgets/meal_item.dart';

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
            id: state.favouritesMeals[index].id,
            title: state.favouritesMeals[index].title,
            imageUrl: state.favouritesMeals[index].imageUrl,
            duration: state.favouritesMeals[index].duration,
            affordability: state.favouritesMeals[index].affordability,
            complexity: state.favouritesMeals[index].complexity,
          );
        },
        itemCount: state.favouritesMeals.length,
      );
    } else {
      return const Center(
        child: Text('Something went wrong'),
      );
    }
  }
}
