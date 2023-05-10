import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorties_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _currentTabIndex = 0;
  final _tabs = [
    {'title': 'Categories', 'widget': const CategoriesScreen()},
    {'title': 'Favorites', 'widget': const FavoritesScreen()},
  ];

  void selectTab(int tabIndex) {
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_currentTabIndex]['title'] as String),
      ),
      body: _tabs[_currentTabIndex]['widget'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: selectTab,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: _tabs[0]['title'] as String,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: _tabs[1]['title'] as String,
          ),
        ],
      ),
      drawer: const Drawer(child: MainDrawer()),
    );
  }
}
