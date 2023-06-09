import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
          bodySmall: TextStyle(fontSize: 12, color: Colors.black54),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: Colors.pink[50],
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.pink,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
        ),
      ),
      routes: {
        '/': (context) => const TabsScreen(),
        '/category-meals': (context) => const CategoryMealsScreen(),
        '/meal-detail': (context) => const MealDetail(),
        '/filters': (context) => const FiltersScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
