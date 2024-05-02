// ignore_for_file: prefer_const_constructorss, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../Details/Filter_Details.dart';
import '../Details/Categories_Details.dart';
import '../Details/Single_Meals_Details.dart';
import '../Details/TabBar_Details.dart';
import '../Details/categories.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized() ;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
  runApp(MaterialApp(
    // home: CategoriesScreen(),
    routes: {
      "/":(context) => TabsScreen(),
      CategoriesDetails.routeName: (context) => CategoriesDetails(),
      SingleMealDetails.routeName: (context) => SingleMealDetails(),
      FiltersDetails.routeName:(context) => FiltersDetails(),
    },
    onGenerateRoute: (settings) {
      print(settings.arguments);
      return MaterialPageRoute(builder: (context) {
        return CategoriesScreen();
      });
    },
    onUnknownRoute: (settings) {
      return MaterialPageRoute(builder: (context) {
        return CategoriesScreen();
      },);
    },
    theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pinkAccent.shade400,
        hintColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 29, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleLarge: TextStyle(
                fontSize: 21,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold),
          displayLarge: TextStyle(
              fontSize: 35,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              fontSize: 30,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),

        )),
  ));
}
