import 'package:flutter/material.dart';
import 'package:recipedia/view/about.dart';

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
        padding: EdgeInsets.only(top:0,bottom:0),
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Image.asset('assets/logo_recipedia.png', scale: 2),
        )
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
                          onPressed: (){},
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
                      fontSize: 24,
                    ),
                      "Account"
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
                        fontSize: 24,
                      ),
                      "About"
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
                                Icons.book,
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
                      "Recipes"
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
                      "Recipes Add"
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
                                Icons.my_library_books,
                                size: 62,
                              )
                            ],
                          )
                      )
                  ),
                  Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      "Recipes Edit"
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

}
