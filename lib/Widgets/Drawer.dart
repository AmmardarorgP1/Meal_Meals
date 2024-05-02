// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meals_app/Details/Filter_Details.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key,   this.saveFilters, this.filters, this.savedFilters});
   final Function? saveFilters;
   final Map<String,bool>? filters;
   final Map<String,bool>? savedFilters;


  Widget listTileBuilt(IconData icons, String text, Function handler,BuildContext context) {
    return MediaQuery.of(context).size.width > 500 ? ListTile(
      leading: Icon(icons,size: 32,),
      title: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontFamily: 'RobotoCondensed',
            fontSize: 30),
      ),
      onTap: () {
        handler();
      },
    ):ListTile(
      leading: Icon(icons),
      title: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontFamily: 'RobotoCondensed',
            fontSize: 20),
      ),
      onTap: () {
        handler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            alignment: Alignment.center,
            color: Theme.of(context).hintColor,
            child: MediaQuery.of(context).size.width > 500 ?Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                  fontSize: 35),
            ):Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                  fontSize: 25),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          listTileBuilt(Icons.restaurant, "Meals", () {
           // print("This is in drawer");
           //  print(savedFilters);
            Navigator.pushReplacementNamed(context, "/",arguments: savedFilters ?? {"isGlutenFree": false,
              "isLactoseFree": false,
              "isVegetarian": false,
              "isVegan": false});
          },context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.024,),
          listTileBuilt(Icons.settings, "Filters", () {
            Navigator.pushNamed(context, FiltersDetails.routeName,arguments: [saveFilters?? (){ print ("this is null save");},filters ?? {"isGlutenFree": false,
              "isLactoseFree": false,
              "isVegetarian": false,
              "isVegan": false}]);
          },context),
        ],
      ),
    );
  }
}
