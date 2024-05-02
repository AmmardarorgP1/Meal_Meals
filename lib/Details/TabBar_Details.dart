// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


import '../Models/meal.dart';
import '../Widgets/dummy_data.dart';
import '../Widgets/Drawer.dart';
import './Favourites_Details.dart';
import './categories.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
@override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // final List<Map<String, Object>> screens = [
  //   {"pages": CategoriesScreen(), "title": "Meals@Meals"},
  //   {"pages": FavouritesDetails(), "title": "Favourites"}
  // ];
  // int selectedCurrentIndex = 0;

  // _selectOption(int index) {
  //   setState(() {
  //     print(index);
  //     selectedCurrentIndex = index;
  //   });
  // }

  late TabController _tabController;

  Map<String, bool> _mealsFilters = {
    "isGlutenFree": false,
    "isLactoseFree": false,
    "isVegetarian": false,
    "isVegan": false
  };

  List<Meal> _mealsAvailable = dummyMeals;
  List<Meal> _favoutiteMeals = [];
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if(arguments != null)
      {
        print("args are null");
        print(arguments);
        _mealsFilters = arguments as Map<String,bool>;

      }
    else
      {
        _mealsFilters;
      }

  }
  void _saveFilters(Map<String, bool> filters) {
    setState(() {
      _mealsFilters = filters;

     _mealsAvailable = dummyMeals.where((meal) {
        if (_mealsFilters["isGlutenFree"]! && meal.isGlutenFree != true) {
          return false;
        }
        if (_mealsFilters["isLactoseFree"]! && meal.isLactoseFree != true) {
          return false;
        }
        if (_mealsFilters["isVegetarian"]! && meal.isVegetarian != true) {
          return false;
        }
        if (_mealsFilters["isVegan"]! && meal.isVegan != true) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavouriteMeals(String mealId)
  {
    final existingId = _favoutiteMeals.indexWhere((meal) => meal.id == mealId );

    if(existingId >=0)
      {
        _favoutiteMeals.removeAt(existingId);
      }
    else
      {
        _favoutiteMeals.add(_mealsAvailable.firstWhere((meal) => meal.id == mealId ));
      }

  }

  bool markFavourite(String mealId)
  {

    return _favoutiteMeals.any((meal) => meal.id ==mealId);

  }
  @override

  Widget build(BuildContext context) {
      //     return Scaffold(
    //       appBar: AppBar(
    //         title:  Text(screens[selectedCurrentIndex]["title"] as String ),
    //         centerTitle: true,
    //         backgroundColor: Theme.of(context).primaryColor,
    //       ),
    //       body: screens[selectedCurrentIndex]["pages"] as Widget,
    //     bottomNavigationBar: BottomNavigationBar(
    //       backgroundColor: Theme.of(context).primaryColor,
    //       onTap: _selectOption,
    //       currentIndex: selectedCurrentIndex,
    //       selectedItemColor: Theme.of(context).hintColor,
    //       // type: BottomNavigationBarType.shifting,
    //
    //       items: [
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.category),
    //           label: "Categories",
    //         ),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.favorite), label: "Favourite"),
    //       ],
    //     ),
    //   );
    // }
    // used here so when the page is again built there should no data loss or initialize again...
setState(() {
  _mealsAvailable = dummyMeals.where((meal) {
    if (_mealsFilters["isGlutenFree"]! && meal.isGlutenFree != true) {
      return false;
    }
    if (_mealsFilters["isLactoseFree"]! && meal.isLactoseFree != true) {
      return false;
    }
    if (_mealsFilters["isVegetarian"]! && meal.isVegetarian != true) {
      return false;
    }
    if (_mealsFilters["isVegan"]! && meal.isVegan != true) {
      return false;
    }

    return true;
  }).toList();
});



// Calculate the icon size based on the screen width
double iconSize = MediaQuery.of(context).size.width * 0.1;

// print("These are meals ");
// print(mealsAvailable[2].title);    // used for debugging take care of index

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.16),
          child: AppBar(
            title:MediaQuery.of(context).size.width > 500 ? const Text("Meal@Meals",style: TextStyle(fontSize: 32),):const Text("Meal@Meals",),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(
                indicatorColor: Theme.of(context).hintColor,
                labelColor: Theme.of(context).hintColor,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.category,
                      size: iconSize * 0.4 ,
                    ),
                    child:MediaQuery.of(context).size.width > 500 ? Text("Categories",style: TextStyle(fontSize: 20),): Text(
                      "Categories",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.favorite,
                      size: iconSize * 0.4,
                    ),
                    // text: "Favourites",
                    child: MediaQuery.of(context).size.width > 500 ? Text("Favourites",style: TextStyle(fontSize: 20),):Text("Favourites", style: TextStyle(fontSize: 12)),
                  )
                ]),
          ),
        ),
        drawer: DrawerCustom(
          saveFilters: _saveFilters,
          filters:_mealsFilters,
          savedFilters: _mealsFilters,
        ),
        body: TabBarView(children: [
          CategoriesScreen(
            mealsAvailable: _mealsAvailable, markAsFavourite: markFavourite,toggleFavouriteMeals: _toggleFavouriteMeals,
          ),
          FavouritesDetails(favouriteMeals: _favoutiteMeals,markAsFavourite: markFavourite, toggleFavouriteMeals: _toggleFavouriteMeals,)
        ]),
      ),
    );
  }
}
