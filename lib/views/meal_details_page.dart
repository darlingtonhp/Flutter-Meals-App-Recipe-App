import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/app/cubit/filter_cubit.dart';
import 'package:meals_app/views/cubit/favourites_cubit.dart';

class MealDetailsPage extends StatelessWidget {
  final String mealsId;
  const MealDetailsPage({Key? key, required this.mealsId}) : super(key: key);

  Widget sectionTitle(BuildContext context, String text) {
    return SizedBox(
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget sectionBody(Widget child) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        if (state is FilterInitial) {
          return const CircularProgressIndicator();
        }
        if (state is FilterLoaded) {
          final selectedMeal =
              state.filteredMeals.firstWhere((meal) => meal.id == mealsId);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                selectedMeal.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  sectionTitle(context, 'Ingredients required'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: sectionBody(
                      ListView.builder(
                        itemBuilder: (context, index) => Card(
                          elevation: 4,
                          color: Theme.of(context).canvasColor,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              selectedMeal.ingredients[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ),
                        itemCount: selectedMeal.ingredients.length,
                      ),
                    ),
                  ),
                  sectionTitle(context, 'Directions to prepare'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: sectionBody(
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Material(
                                elevation: 4,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    child: Text(
                                      '# ${index + 1}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: Colors.white),
                                    ),
                                  ),
                                  title: Text(
                                    selectedMeal.steps[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                        itemCount: selectedMeal.steps.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0XFFE59985),
              onPressed: () {
                BlocProvider.of<FavouritesCubit>(context)
                    .toggleFavourite(mealsId);
              },
              child: const Icon(Icons.favorite_outline),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
