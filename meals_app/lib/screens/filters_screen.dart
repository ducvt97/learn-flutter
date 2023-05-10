import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _isGlutenFree = false,
      _isLactoseFree = false,
      _isVegan = false,
      _isVegetarian = false;

  Widget switchTileBuilder(
      bool value, String title, String subTitle, Function(bool) onChange) {
    return SwitchListTile.adaptive(
      value: value,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: onChange,
    );
  }

  @override
  void didChangeDependencies() {
    final filters = ref.watch(filtersProvider);
    _isGlutenFree = filters[Filter.isGlutenFree]!;
    _isVegan = filters[Filter.isVegan]!;
    _isVegetarian = filters[Filter.isVegetarian]!;
    _isLactoseFree = filters[Filter.isLactoseFree]!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.isGlutenFree: _isGlutenFree,
            Filter.isVegan: _isVegan,
            Filter.isVegetarian: _isVegetarian,
            Filter.isLactoseFree: _isLactoseFree,
          });
          return false;
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selections',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                switchTileBuilder(
                  _isGlutenFree,
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  (value) {
                    setState(() {
                      _isGlutenFree = value;
                    });
                  },
                ),
                switchTileBuilder(
                  _isLactoseFree,
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  (value) {
                    setState(() {
                      _isLactoseFree = value;
                    });
                  },
                ),
                switchTileBuilder(
                  _isVegan,
                  'Vegan-free',
                  'Only include vegan-free meals.',
                  (value) {
                    setState(() {
                      _isVegan = value;
                    });
                  },
                ),
                switchTileBuilder(
                  _isVegetarian,
                  'Vegetarian-free',
                  'Only include vegetarian-free meals.',
                  (value) {
                    setState(() {
                      _isVegetarian = value;
                    });
                  },
                ),
              ],
            ))
          ],
        ),
      ),
      drawer: const Drawer(child: MainDrawer()),
    );
  }
}
