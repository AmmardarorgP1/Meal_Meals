// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';

import '../Widgets/dummy_data.dart';

class SingleMealDetails extends StatefulWidget {
  static const routeName = "/Single_Detail";

  SingleMealDetails({super.key});

  @override
  State<SingleMealDetails> createState() => _SingleMealDetailsState();
}

class _SingleMealDetailsState extends State<SingleMealDetails> {


  Widget ingredients(var meal,BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(3.8),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              color: Theme.of(context).hintColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.aspectRatio * 40))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  meal.ingredients[index],
                  style: MediaQuery.of(context).size.width > 500 ? TextStyle(fontWeight: FontWeight.bold,fontSize: 23):TextStyle(fontWeight: FontWeight.bold),
                ),
              ));
        },
        itemCount: meal.ingredients.length,
      ),
    );
  }

  Widget outlinedContainer(Widget mealInstructs,BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.24,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: mealInstructs));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List;
    final argId = args[0];
    final Function markAsFavourite = args[1] ?? (){} ;
    final Function toggleFavouriteMeals = args[2] ?? (){};
    final meal = dummyMeals.firstWhere((meal) => meal.id == argId);

    return Scaffold(
      appBar: AppBar(
        title:MediaQuery.of(context).size.width > 500 ? Text(meal.title,style: TextStyle(fontSize: 32),) : Text(meal.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Image.network(
            meal.imageUrl,
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MediaQuery.of(context).size.width > 500? Center(
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.displayLarge,
                )): Center(
                child: Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge,
            )),
          ),
          outlinedContainer(ingredients(meal,context),context),
          const Divider(thickness: 1.0),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child:MediaQuery.of(context).size.width > 500 ? Text(
              "Steps",
              style: Theme.of(context).textTheme.displayLarge,
            ):Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge,
            ) ,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.24,
              width: MediaQuery.of(context).size.width * 0.42,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {


                    return ListTile(
                      leading:  CircleAvatar(
                        radius: MediaQuery.of(context).size.width > 500 ? 25 : 20 ,
                        backgroundColor: Theme.of(context).primaryColor,
                        child:  MediaQuery.of(context).size.width > 500 ? Text("#${index+1}",style: TextStyle(color: Colors.white70,fontSize: 20  )):Text("#${index+1}",style: TextStyle(color: Colors.white70),),

                      ),
                      title: MediaQuery.of(context).size.width > 500 ?Text("${meal.steps[index]}",style: TextStyle(fontSize: 25),):Text("${meal.steps[index]}"),
                    );
                  },
                  itemCount: meal.steps.length,
                ),
              ),
            ),
          )
        ]),
      ),

      floatingActionButton: MediaQuery.of(context).size.width > 500 ? FloatingActionButton.large(onPressed: () {
        // Navigator.pop(context,meal.id);


        setState(() { toggleFavouriteMeals(meal.id);});


      },foregroundColor: Theme.of(context).primaryColor,backgroundColor: Theme.of(context).hintColor,child: markAsFavourite(meal.id)? Icon(Icons.star) :  Icon(Icons.star_border),)
            : FloatingActionButton(onPressed: () {
        // Navigator.pop(context,meal.id);


        setState(() { toggleFavouriteMeals(meal.id);});


      },foregroundColor: Theme.of(context).primaryColor,backgroundColor: Theme.of(context).hintColor,child: markAsFavourite(meal.id)? Icon(Icons.star) :  Icon(Icons.star_border),),
    );
  }
}
