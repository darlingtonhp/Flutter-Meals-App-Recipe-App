import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget _buildSwitchListTile(
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Your filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // final selectedFilters = {
              //   'gluten': _glutenFree,
              //   'lactose': _lactoseFree,
              //   'vegan': _vegan,
              //   'vegetarian': _vegetarian,
              // };
            },
          ),
        ],
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
                  'Gluten-free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (value) {
                    setState(
                      () {
                        _glutenFree = value;
                      },
                    );
                  },
                ),
                const Divider(
                  thickness: 20,
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals',
                  _lactoseFree,
                  (value) {
                    setState(
                      () {
                        _lactoseFree = value;
                      },
                    );
                  },
                ),
                const Divider(
                  thickness: 20,
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  (value) {
                    setState(
                      () {
                        _vegan = value;
                      },
                    );
                  },
                ),
                const Divider(
                  thickness: 20,
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                  (value) {
                    setState(
                      () {
                        _vegetarian = value;
                      },
                    );
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
  }
}
