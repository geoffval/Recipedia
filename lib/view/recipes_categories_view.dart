import 'package:flutter/material.dart';
import 'package:recipedia/view/add_recipes_view.dart';
import 'package:recipedia/view/edit_recipes_view.dart';
import 'recipes_menu_view.dart' as recipes_menu;

int _recipeItem = 1;
int get recipeItem => _recipeItem;
//1 = food, 2 = drinks, 3 = dessert, 4 = pastries

class RecipesCategoriesPage extends StatefulWidget {
  @override
  State<RecipesCategoriesPage> createState() => _RecipesCategoriesPageState();
}

class _RecipesCategoriesPageState extends State<RecipesCategoriesPage> {
  final bool addOrEdit = recipes_menu.addOrEditRecipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CATEGORIES'),
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
                            _recipeItem = 1;
                            if(addOrEdit){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => AddRecipesScreen()),
                              );
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => EditRecipesScreen()),
                              );
                            }
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
                            _recipeItem = 2;
                            if(addOrEdit){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => AddRecipesScreen()),
                              );
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => EditRecipesScreen()),
                              );
                            }
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
                            _recipeItem = 3;
                            if(addOrEdit){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => AddRecipesScreen()),
                              );
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => EditRecipesScreen()),
                              );
                            }
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
                      "Cake"
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
                            _recipeItem = 4;
                            if(addOrEdit){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => AddRecipesScreen()),
                              );
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => EditRecipesScreen()),
                              );
                            }
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
        ],
      ),
    );
  }

}
