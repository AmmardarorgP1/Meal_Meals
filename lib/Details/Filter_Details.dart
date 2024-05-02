// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meals_app/Details/TabBar_Details.dart';
import 'package:meals_app/Widgets/Drawer.dart';

class FiltersDetails extends StatefulWidget {
  static const routeName = "/Filter_Details";

  const FiltersDetails({super.key});

  @override
  State<FiltersDetails> createState() => _FiltersDetailsState();
}

class _FiltersDetailsState extends State<FiltersDetails> {
  late Function saveFilters;
  late Map<String,bool> filtersFromMain;

  late bool _isGlutenFree ;
  late bool _isVegan ;
  late bool _isVegetarian;
  late bool _isLactoseFree;


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final function = ModalRoute.of(context)?.settings.arguments as List;
    saveFilters = function[0];
     filtersFromMain = function[1];
    // print("these are filter screen ------------------------------------------------------");
    //  print(filtersFromMain);
     _isGlutenFree = filtersFromMain["isGlutenFree"] as bool;
        _isVegan = filtersFromMain["isVegan"] as bool;
        _isVegetarian = filtersFromMain["isVegetarian"] as bool ;
        _isLactoseFree = filtersFromMain["isLactoseFree"] as bool;

  }

  late Map<String,bool> filters = {"isGlutenFree": _isGlutenFree,
    "isLactoseFree": _isLactoseFree,
    "isVegetarian": _isVegetarian,
    "isVegan": _isVegan};



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Filters",
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {


              setState(() {
                filters = {
                  "isGlutenFree": _isGlutenFree,
                  "isLactoseFree": _isLactoseFree,
                  "isVegetarian": _isVegetarian,
                  "isVegan": _isVegan
                };
                print("Save Filters");
                print(filters);


                saveFilters(filters);
              });

            },
          )
        ],
      ),
      drawer:  DrawerCustom(savedFilters: filters,),
      body: Column(
        children: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:  MediaQuery.of(context).size.width > 500 ? const Text(
              "Adjust Meal Selection",
              style:  TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ): const Text(
              "Adjust Meal Selection",
              style:  TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
          )),
          MediaQuery.of(context).size.width > 500 ? SwitchListTile(
            title: Text("Gluten-Free",style: TextStyle(fontSize: 25),),
            subtitle: Text("Includes only gluten-free meals"),
            value: _isGlutenFree,
            onChanged: (bool value) {
              setState(() {
                _isGlutenFree = value;
              });
            },
            activeColor: Theme.of(context).hintColor,
          ):SwitchListTile(
            title: Text("Gluten-Free"),
            subtitle: Text("Includes only gluten-free meals"),
            value: _isGlutenFree,
            onChanged: (bool value) {
              setState(() {
                _isGlutenFree = value;
              });
            },
            activeColor: Theme.of(context).hintColor,
          ),
          SwitchListTile(
              title: Text("Lactose-Free"),
              subtitle: Text("Includes only lactose-free meals"),
              value: _isLactoseFree,
              onChanged: (bool value) {
                setState(() {
                  _isLactoseFree = value;
                });
              },
              activeColor: Theme.of(context).hintColor),
          SwitchListTile(
              title: Text("Vegetarian"),
              subtitle: Text("Includes only vegetarian meals"),
              value: _isVegetarian,
              onChanged: (bool value) {
                setState(() {
                  _isVegetarian = value;
                });
              },
              activeColor: Theme.of(context).hintColor),
          SwitchListTile(
              title: Text("Vegan"),
              subtitle: Text("Includes only vegan meals"),
              value: _isVegan,
              onChanged: (bool value) {
                setState(() {
                  _isVegan = value;
                });
              },
              activeColor: Theme.of(context).hintColor),
        ],
      ),
    );
  }
}
