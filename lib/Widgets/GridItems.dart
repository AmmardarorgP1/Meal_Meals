// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


import '../Details/Categories_Details.dart';
import '../Models/meal.dart';

class GridItems extends StatelessWidget {
  const   GridItems(
      {super.key, required this.id, required this.title, required this.color, required this.mealsAvailable, this.markAsFavourite,  this.toggleFavouriteMeals});

  final String id;
  final String title;
  final Color color;
  final List<Meal> mealsAvailable;
  final Function? markAsFavourite;
  final Function? toggleFavouriteMeals;

  void selectCategory(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return CategoriesDetails(
    //     catId: id,
    //     catTitle: title,
    //   );
    // }));

    Navigator.pushNamed(context, CategoriesDetails.routeName,arguments: {"id": id,"title":title,"meals":mealsAvailable ,"markAsFavourite": markAsFavourite,"toggleFavouriteMeals":toggleFavouriteMeals});


  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: MediaQuery.of(context).size.width > 500 ? Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ): Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
