import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meals_app/models/dummy_data.dart';

import '../../models/meal.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(const FavouritesInitial());
  List<Meal> favouriteMeals = [];
  void toggleFavourite(String newMealId) {
    final existingIndex =
        favouriteMeals.indexWhere((meal) => meal.id == newMealId);
    if (existingIndex == -1) {
      favouriteMeals.add(
          DummyData().mealsData.firstWhere((meal) => meal.id == newMealId));
      emit(FavouritesLoaded(favouritesMeals: favouriteMeals));
    } else {
      favouriteMeals.removeAt(existingIndex);
      emit(FavouritesLoaded(favouritesMeals: favouriteMeals));
    }
  }
}
