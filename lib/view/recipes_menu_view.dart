import 'package:flutter/material.dart';
import 'package:recipedia/view/add_recipes_view.dart';
import 'package:recipedia/view/dessert.dart';
import 'package:recipedia/view/drink.dart';
import 'package:recipedia/view/food.dart';
import 'package:recipedia/view/pastries.dart';
import 'package:recipedia/view/recipes_categories_view.dart';


class RecipesPage extends StatefulWidget {
  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

bool _addOrEditRecipes = true;
bool get addOrEditRecipes => _addOrEditRecipes;



class _RecipesPageState extends State<RecipesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENU'),
        actions: <Widget>[
          Padding(padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.info)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: HomePageController(context)
          )
        ],
      ),
    );
  }

  Widget HomePageController(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Image.asset('assets/images/Recipedia 1.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 110,
                      width: 110,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                          ),
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => FoodScreen()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.fastfood,
                                size: 62,)
                            ],
                          )
                      )
                  ),
                  Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      "Food"
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 110,
                      width: 110,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                          ),
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => DrinkScreen()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.emoji_food_beverage,
                                size: 62,
                                color: Colors.lightBlueAccent,)
                            ],
                          )
                      )
                  ),
                  Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      "Drinks"
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 110,
                      width: 110,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                          ),
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => DessertScreen()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.cake,
                                size: 62,
                                color: Colors.pinkAccent,)
                            ],
                          )
                      )
                  ),
                  Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      "Dessert"
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 110,
                      width: 110,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                          ),
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => PastriesScreen()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.breakfast_dining,
                                size: 62,
                                color: Colors.brown,)
                            ],
                          )
                      )
                  ),
                  Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      "Pastries"
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 110,
                      width: 110,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                          ),
                        onPressed: (){
                            _addOrEditRecipes = false;
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => RecipesCategoriesPage()),
                          );
                        },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.my_library_books,
                                size: 62,)
                            ],
                          )
                      )
                  ),
                  Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      "Edit Recipes"
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 110,
                      width: 110,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                          ),
                          onPressed: (){
                            _addOrEditRecipes = true;
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => AddRecipesScreen()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.bookmark_add,
                                size: 62,)
                            ],
                          )
                      )
                  ),
                  Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      "Add Recipe"
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}
