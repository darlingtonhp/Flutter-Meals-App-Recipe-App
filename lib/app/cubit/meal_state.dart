part of 'meal_cubit.dart';

@immutable
abstract class MealState {
  const MealState();
}

class MealInitial extends MealState {
  const MealInitial();
}

class MealLoaded extends MealState {
  final List<Meal> meals;
  final Map<String, bool> filteredMeals;

  const MealLoaded({required this.filteredMeals, required this.meals});
}
