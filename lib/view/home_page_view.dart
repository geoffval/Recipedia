import 'package:flutter/material.dart';
import 'package:recipedia/view/about.dart';
import 'package:recipedia/view/account.dart';
import 'recipes_menu_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 1,
              child: _buildImage()
          ),
          Expanded(
            flex: 3,
              child: HomePageController(context)
          )
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Image.asset('assets/logo_recipedia.png')
        )
    );
  }

  Widget HomePageController(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 120,
                child: Column(
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
                                MaterialPageRoute(builder: (context) => AccountScreen()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  size: 62,)
                              ],
                            )
                        )
                    ),
                    Text(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        "Account"
                    )
                  ],

                ),
              ),

              Container(
                width: 120,
                child: Column(
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
                                MaterialPageRoute(builder: (context) => const AboutScreen()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.info,
                                  size: 62,)
                              ],
                            )
                        )
                    ),
                    Text(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        "About"
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 120,
                child: Column(
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
                                MaterialPageRoute(builder: (context) => RecipesPage()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.book,
                                  size: 62,)
                              ],
                            )
                        )
                    ),
                    Text(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        "Recipes"
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
