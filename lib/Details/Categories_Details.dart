import '../Models/meal.dart';
import '../Widgets/dummy_data.dart';
import 'meals_Details.dart';



import 'package:flutter/material.dart';

class CategoriesDetails extends StatefulWidget {
  static const routeName = "/Categories_Details";

  // const CategoriesDetails(
  //     {super.key,
  //     required this.catId,
  //     required this.catTitle,});
  //
  // final String catId;
  // final String catTitle;

  const CategoriesDetails({
    super.key,
  });

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  late List<Meal> mealsFiltered;
  late String catTitle;
  bool _loadedData = false;
  late Function markAsFavourite;
  late Function toggleFavouriteMeals;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void didChangeDependencies() {

    if(_loadedData == false)
    {
      final args =
      ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, Object?>;
      catTitle = args["title"].toString();
      final catId = args["id"];
      final mealsAvailable = args["meals"] as List<Meal>;
      markAsFavourite = args["markAsFavourite"] as Function;
      toggleFavouriteMeals = args["toggleFavouriteMeals"] as Function;

      mealsFiltered = mealsAvailable.where((meals) {
        return meals.categories.contains(catId);
      }).toList();
      _loadedData = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();


  }
  void mealRemovedByUser(String mealId)
  {
    setState(() {
      mealsFiltered.removeWhere((meal) {
        return meal.id == mealId;
      });
    });

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: MediaQuery.of(context).size.width > 500 ?Text(catTitle,style: const TextStyle(fontSize: 32),) :Text(catTitle),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealsDetails(
            title: mealsFiltered[index].title,
            duration: mealsFiltered[index].duration,
            affordability: mealsFiltered[index].affordability,
            complexity: mealsFiltered[index].complexity,
            imageUrl: mealsFiltered[index].imageUrl,
            id: mealsFiltered[index].id, markAsFavourite: markAsFavourite ?? (){}, toggleFavouriteMeals: toggleFavouriteMeals?? (){},
            // removeMeal: mealRemovedByUser,
          );
        },
        itemCount: mealsFiltered.length,
      ),


    );
  }
}
