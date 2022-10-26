import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../models/dummy_data.dart';
import '../../models/meal.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  Map<String, bool> defaultFilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  late Map<String, bool> filters;

  MealCubit() : super(const MealInitial()) {
    // Load SavedFilters
    filters = defaultFilters;
    // Filter dummyData with Filters;
    filterDummyData();
  }

  void setFilters(Map<String, bool> newFilters) {
    filters = newFilters;
    filterDummyData();
    //emit state
  }

  void filterDummyData() {
    // save filters;

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

    emit(MealLoaded(meals: meals, filteredMeals: filters));
  }
}
