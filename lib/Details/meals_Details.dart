// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import'package:flutter/material.dart';


import '../Models/meal.dart';
import './Single_Meals_Details.dart';



class MealsDetails extends StatelessWidget {
  const MealsDetails({super.key,required this.title, required this.imageUrl, required this.affordability, required this.complexity, required this.duration, required this.id, required this.markAsFavourite, required this.toggleFavouriteMeals});


  final String id;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final String title;
  final Function markAsFavourite;
  final Function toggleFavouriteMeals;
  String get complexityText
  {
    if(complexity == Complexity.Simple)
      {
        return "Simple";

      }
    else if(complexity == Complexity.Challenging)
    {
      return "Challenging";

    }
    else if(complexity == Complexity.Hard)
    {
      return "Hard";

    }
    else
      {
        return "Unknown";
      }
  }

  String get affordabilityText
  {
    if(affordability == Affordability.Affordable)
    {
      return "Affordable";

    }
    else if(affordability == Affordability.Pricey)
    {
      return "Pricey";

    }
    else if(affordability == Affordability.Luxurious)
    {
      return "Luxurious";

    }
    else
    {
      return "Unknown";
    }
  }


  void  selectMeal(BuildContext context)
  {
    Navigator.pushNamed(context, SingleMealDetails.routeName,arguments: [id,markAsFavourite,toggleFavouriteMeals]).then((mealId) {

      if(mealId != null)
        {
          print(mealId);
          // removeMeal(mealId);
        }

    } );

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectMeal(context);
      },
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 6,
          child: Column(
            children: <Widget>[
              Stack(
                children:<Widget> [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0)),
                    child: Image.network(imageUrl,fit: BoxFit.cover,),
                  ),
                  Positioned(bottom: 20 , right: 10,child: Container(
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.black54
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child:MediaQuery.of(context).size.width > 500 ? Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ):Text(
                            title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                    ),
                  ))
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child:MediaQuery.of(context).size.width > 500 ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.watch_later_outlined,size: 40,),
                        SizedBox(width: 4,),
                        Text("${duration}min",style: TextStyle(fontSize: 25),)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work_outline,size: 40,),
                        SizedBox(width: 4,),
                        Text(complexityText,style: TextStyle(fontSize: 25),)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money_outlined,size: 40,),
                        SizedBox(width: 4,),
                        Text(affordabilityText,style: TextStyle(fontSize: 25),)
                      ],
                    )
                  ],
                ):Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.watch_later_outlined),
                        SizedBox(width: 4,),
                        Text("${duration}min")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work_outline),
                        SizedBox(width: 4,),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money_outlined),
                        SizedBox(width: 4,),
                        Text(affordabilityText)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
