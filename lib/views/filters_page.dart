import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../app/cubit/meal_cubit.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({
    Key? key,
  }) : super(key: key);

  Widget _buildSwitchListTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required bool currentValue,
    required Function(bool value) onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MealLoaded) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: const Text('Your filters'),
            ),
            drawer: const MainDrawer(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Adjust your meal selection',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      _buildSwitchListTile(
                        context: context,
                        title: 'Gluten-free',
                        subtitle: 'Only include gluten-free meals',
                        currentValue: state.filterData['gluten'] ?? false,
                        onChanged: (value) {
                          state.filterData['gluten'] = value;
                          context
                              .read<MealCubit>()
                              .setFilters(state.filterData);
                        },
                      ),
                      const Divider(
                        thickness: 20,
                      ),
                      _buildSwitchListTile(
                        context: context,
                        title: 'Lactose-free',
                        subtitle: 'Only include lactose-free meals',
                        currentValue: state.filterData['lactose'] ?? false,
                        onChanged: (value) {
                          state.filterData['lactose'] = value;
                          context
                              .read<MealCubit>()
                              .setFilters(state.filterData);
                        },
                      ),
                      const Divider(
                        thickness: 20,
                      ),
                      _buildSwitchListTile(
                        context: context,
                        title: 'Vegetarian',
                        subtitle: 'Only include vegetarian meals',
                        currentValue: state.filterData['vegetarian'] ?? false,
                        onChanged: (value) {
                          state.filterData['vegetarian'] = value;
                          context
                              .read<MealCubit>()
                              .setFilters(state.filterData);
                        },
                      ),
                      const Divider(
                        thickness: 20,
                      ),
                      _buildSwitchListTile(
                        context: context,
                        title: 'Vegan',
                        subtitle: 'Only include vegan meals',
                        currentValue: state.filterData['vegan'] ?? false,
                        onChanged: (value) {
                          state.filterData['vegan'] = value;
                          context
                              .read<MealCubit>()
                              .setFilters(state.filterData);
                        },
                      ),
                      const Divider(
                        thickness: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('Something bad happened'),
          );
        }
      },
    );
  }
}
