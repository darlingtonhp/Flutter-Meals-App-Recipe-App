part of 'filter_cubit.dart';

@immutable
abstract class FilterState {
  const FilterState();
}

class FilterInitial extends FilterState {
  const FilterInitial();
}

class FilterLoaded extends FilterState {
  final List<Meal> filteredMeals;
  final Map<String, bool> filters;
  const FilterLoaded({required this.filters, required this.filteredMeals});
}
