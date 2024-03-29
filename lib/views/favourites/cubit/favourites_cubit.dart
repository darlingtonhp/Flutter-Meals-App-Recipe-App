import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/models/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final String favouriteDataPref = 'favouriteData';
  List<Meal> favourites = [];
  SharedPreferences? _prefs;
  FavouritesCubit() : super(const FavouritesInitial()) {
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      loadSavedFavourites(prefs);
    });
  }

  void toggleFavourite(String newMealId) {
    final existingIndex = favourites.indexWhere((meal) => meal.id == newMealId);
    if (existingIndex == -1) {
      favourites.add(
          DummyData().mealsData.firstWhere((meal) => meal.id == newMealId));
    } else {
      favourites.removeAt(existingIndex);
    }

    unawaited(saveFavourites(favourites).onError(
      (error, stackTrace) => print(stackTrace),
    ));
    emit(
      FavouritesLoaded(
        favouritedMeals: favourites,
      ),
    );
  }

  Future<void> saveFavourites(List<Meal> favouritedList) async {
    favourites = favouritedList;
    List<String> favouritesJsonList =
        favouritedList.map((meal) => jsonEncode(meal.toJson())).toList();
    await _prefs?.setStringList(favouriteDataPref, favouritesJsonList);
  }

  loadSavedFavourites(SharedPreferences prefs) async {
    List<String>? favouritedList = prefs.getStringList(favouriteDataPref);
    try {
      if (favouritedList != null) {
        List<Meal> savedFavs = favouritedList
            .map((mealJson) => Meal.fromJson(jsonDecode(mealJson)))
            .toList();
        favourites = savedFavs;
        emit(FavouritesLoaded(favouritedMeals: favourites));
      }
    } catch (e) {
      print(e);
    }
  }
}
