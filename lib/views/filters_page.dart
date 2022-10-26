import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../app/cubit/filter_cubit.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({
    Key? key,
  }) : super(key: key);

  Widget _buildSwitchListTile(
    BuildContext context,
    String title,
    String subtitle,
    bool currentValue,
    Function(bool value) onChanged,
  ) {
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
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        if (state is FilterInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FilterLoaded) {
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
                        context,
                        'Gluten-free',
                        'Only include gluten-free meals',
                        state.filters['gluten'] ?? false,
                        (value) {
                          state.filters['gluten'] = value;
                          context.read<FilterCubit>().setFilters(state.filters);
                        },
                      ),
                      const Divider(
                        thickness: 20,
                      ),
                      _buildSwitchListTile(
                        context,
                        'Lactose-free',
                        'Only include lactose-free meals',
                        state.filters['lactose'] ?? false,
                        (value) {
                          state.filters['lactose'] = value;
                          context.read<FilterCubit>().setFilters(state.filters);
                        },
                      ),
                      const Divider(
                        thickness: 20,
                      ),
                      _buildSwitchListTile(
                        context,
                        'Vegetarian',
                        'Only include vegetarian meals',
                        state.filters['vegetarian'] ?? false,
                        (value) {
                          state.filters['vegetarian'] = value;
                          context.read<FilterCubit>().setFilters(state.filters);
                        },
                      ),
                      const Divider(
                        thickness: 20,
                      ),
                      _buildSwitchListTile(
                        context,
                        'Vegan',
                        'Only include vegan meals',
                        state.filters['vegan'] ?? false,
                        (value) {
                          state.filters['vegan'] = value;
                          context.read<FilterCubit>().setFilters(state.filters);
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
