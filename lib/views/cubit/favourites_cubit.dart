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
  SharedPreferences? _prefs;
  List<Meal> favouriteMeals = [];
  FavouritesCubit() : super(const FavouritesInitial()) {
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      loadSavedFavourites(prefs);
    });
  }

  void toggleFavourite(String newMealId) {
    final existingIndex =
        favouriteMeals.indexWhere((meal) => meal.id == newMealId);
    if (existingIndex == -1) {
      favouriteMeals.add(
          DummyData().mealsData.firstWhere((meal) => meal.id == newMealId));
    } else {
      favouriteMeals.removeAt(existingIndex);
    }

    unawaited(saveFavourites(favouriteMeals).onError(
      (error, stackTrace) => print(stackTrace),
    ));
    emit(
      FavouritesLoaded(
        favouritedMeals: favouriteMeals,
      ),
    );
  }

  // String favouriteToJson(List<Meal> favouriteMealsFunc) =>
  //     json.encode(List<dynamic>.from(favouriteMeals.map((e) => e.toJson())));

  // List<Meal> favouriteFromJson(String str) =>
  //     List<Meal>.from(json.decode(str).map((e) => Meal.fromJson(e)));

  Future<void> saveFavourites(List<Meal> favouriteMealsData) async {
    String favouriteList = json.encode(
      favouriteMealsData,
      // toEncodable: (Object? value) => value is Meal
      //     ? Meal.toJson(value)
      //     : throw UnsupportedError('Cannot convert to JSON: $value')
    );
    await _prefs?.setString(favouriteDataPref, favouriteList);
    // String favouriteList = json.encode(favouriteMealsData);
    // await _prefs?.setString(favouriteDataPref, favouriteList);
  }

  loadSavedFavourites(SharedPreferences prefs) async {
    String? favouritedList = prefs.get(favouriteDataPref) as String?;
    try {
      if (favouritedList != null) {
        var favouriteMealsData = json.decode(favouritedList) as List<dynamic>;
        // List<dynamic> favouriteMealsData =
        //     List<dynamic>.from(json.decode(favouritedList));
        // var favouriteMealsData = jsonDecode(favouritedList);
        // var favouriteMealsData = jsonDecode(favouritedList);
        favouriteMeals = favouriteMealsData as List<Meal>;
        // List<Meal> favouriteMealsData = favouriteFromJson(favouritedList);

        // favouriteMeals = favouriteMealsData as List<Meal>;
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  bool markAsFavourite(String id) {
    return favouriteMeals.any((meal) => meal.id == id);
  }
}
