part of 'favourites_cubit.dart';

@immutable
abstract class FavouritesState {
  const FavouritesState();
}

class FavouritesInitial extends FavouritesState {
  const FavouritesInitial();
}

class FavouritesLoaded extends FavouritesState {
  final List<Meal> favouritedMeals;

  const FavouritesLoaded({required this.favouritedMeals});
}
