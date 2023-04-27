import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: Column(
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
      drawer: const Drawer(child: MainDrawer()),
    );
  }
}
