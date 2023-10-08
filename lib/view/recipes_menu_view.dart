import 'package:flutter/material.dart';
import 'package:recipedia/view/about.dart';
import 'package:recipedia/view/account.dart';

class RecipesPage extends StatefulWidget {
  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextButton(
                child: Icon(Icons.arrow_back_outlined),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 20,),
              Text("RECIPES")
            ],
          ),
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
                          onPressed: (){},
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
                          onPressed: (){},
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
