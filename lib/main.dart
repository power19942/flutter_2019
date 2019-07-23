import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegi': false
  };
 
  List<Meal> _avilabelMeals;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filteData) {
    setState(() {
      _filters = filteData;

      _avilabelMeals = DUMMY_MEALS.where((m) {
        if (_filters['gluten'] && !m.isGlutenFree) return false;
        if (_filters['lactose'] && !m.isLactoseFree) return false;
        if (_filters['vegan'] && !m.isVegan) return false;
        if (_filters['vegi'] && !m.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    var meal = DUMMY_MEALS.where((m)=>m.id == mealId).first;
    if (_favoriteMeals.contains(meal)){
      setState(() {
        _favoriteMeals.remove(meal);
      });
    }else {
      setState(() {
        _favoriteMeals.add(meal);
      });
    } 
      
  }

  bool  _isMealFavorite(String id){
    return _favoriteMeals.any((m)=>m.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigoAccent,
          //canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_avilabelMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName: (_) => FiltersScreen(_setFilters,_filters)
      },
      onGenerateRoute: (RouteSettings settings) {},
      onUnknownRoute: (RouteSettings settings) {},
    );
  }
}
