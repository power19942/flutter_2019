import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  buildBody(){
    if(favoriteMeals.isEmpty){
      return  Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }else{
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) => MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          duration: favoriteMeals[index].duration,
          complexity: favoriteMeals[index].complexity,
          affordability: favoriteMeals[index].affordability
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:buildBody(),
    );
  }
}