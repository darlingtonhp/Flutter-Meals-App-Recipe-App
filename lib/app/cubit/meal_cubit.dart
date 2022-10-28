import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/dummy_data.dart';
import '../../models/meal.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  final String filterDataPref = 'filterData';
  final Map<String, bool> defaultFilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

//local storage
  late Map<String, bool> filters = defaultFilters;
  SharedPreferences? _prefs;

  MealCubit() : super(const MealInitial()) {
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      loadSavedFilters(prefs);
      filterDummyData();
    });
  }

  setFilters(Map<String, bool> newFilters) async {
    filters = newFilters;

    unawaited(saveFilters(newFilters)
        .onError((error, stackTrace) => print(stackTrace)));

    filterDummyData();
  }

  Future<void> saveFilters(Map<String, bool> filterData) async {
    String encodedFilters = json.encode(filterData);
    await _prefs?.setString(filterDataPref, encodedFilters);
  }

  loadSavedFilters(SharedPreferences prefs) async {
    String? encodedFilters = prefs.getString(filterDataPref);

    try {
      if (encodedFilters != null) {
        var filterData = Map<String, bool>.from(json.decode(encodedFilters));
        // persisted storage
        filters = filterData;
        return;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void filterDummyData() {
    //get dummy data
    var meals = DummyData().mealsData.where(
      (meal) {
        if (filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      },
    ).toList();

    emit(MealLoaded(meals: meals, filterData: filters));
  }
}
