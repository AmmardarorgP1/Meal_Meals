import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';

import '../Widgets/GridItems.dart';
import '../Widgets/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      this.mealsAvailable,
      this.markAsFavourite,
      this.toggleFavouriteMeals});

  final List<Meal>? mealsAvailable;
  final Function? markAsFavourite;
  final Function? toggleFavouriteMeals;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 500
        ? GridView(
            padding: const EdgeInsets.all(15.0),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 1.2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30),
            children: dummyCategories
                .map((catDummy) => GridItems(
                      id: catDummy.id,
                      title: catDummy.title,
                      color: catDummy.color,
                      mealsAvailable: mealsAvailable ?? [],
                      markAsFavourite: markAsFavourite ?? () {},
                      toggleFavouriteMeals: toggleFavouriteMeals ?? () {},
                    ))
                .toList())
        : GridView(
            padding: const EdgeInsets.all(15.0),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: dummyCategories
                .map((catDummy) => GridItems(
                      id: catDummy.id,
                      title: catDummy.title,
                      color: catDummy.color,
                      mealsAvailable: mealsAvailable ?? [],
                      markAsFavourite: markAsFavourite ?? () {},
                      toggleFavouriteMeals: toggleFavouriteMeals ?? () {},
                    ))
                .toList());
  }
}
