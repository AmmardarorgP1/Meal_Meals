// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../Details/meals_Details.dart';




class FavouritesDetails extends StatelessWidget {
  const FavouritesDetails({super.key, required this.favouriteMeals, required this.markAsFavourite, required this.toggleFavouriteMeals});


  final List<Meal> favouriteMeals;
   final Function markAsFavourite;
   final Function toggleFavouriteMeals;
  @override
  Widget build(BuildContext context) {
    print(favouriteMeals);
    return  favouriteMeals == [] ?   ListView.builder(
      itemBuilder: (context, index) {
        return MealsDetails(
          title: favouriteMeals[index].title,
          duration: favouriteMeals[index].duration,
          affordability: favouriteMeals[index].affordability,
          complexity: favouriteMeals[index].complexity,
          imageUrl: favouriteMeals[index].imageUrl,
          id: favouriteMeals[index].id, markAsFavourite: markAsFavourite, toggleFavouriteMeals: toggleFavouriteMeals,
        );
      },
      itemCount: favouriteMeals.length,
    ):MediaQuery.of(context).size.width > 500 ? Center(child: Text("No Favourites Yet- Add Some!!!!",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),):Center(child: Text("No Favourites Yet- Add Some!!!!",style: TextStyle(fontWeight: FontWeight.bold),),) ;
  }
}
