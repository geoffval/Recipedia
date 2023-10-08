import 'package:flutter/material.dart';

class DrinkScreen extends StatelessWidget {
  const DrinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Drink'),
            actions: <Widget>[
              Padding(padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.food_bank)
              ),
            ]
        ),
        body: Container(
          padding: EdgeInsets.only(top:30),
          child: Column(
              children: [
                Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top:30, left: 25),
                      width: 150,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(right: 30)),
                          Image.asset('assets/images/drink1.jpg', scale: 1.6,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 10),
                      width: 150,
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Thai tea'),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text('Minum teh khas Thailand campuran dari susu dari teh yang nikmat')
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only( left: 5),
                      width: 200,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(right: 30)),
                          Image.asset('assets/images/drink2.jpg',scale: 1.7,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 20, right: 15),
                      width: 150,
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Coffee Milkshake'),
                          Padding(padding: EdgeInsets.only(top: 10,right: 15)),
                          Text('Minuman dengan rasa yang kental dan lembut dengan paduan kopi dan coklat')
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      width: 200,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(right: 30)),
                          Image.asset('assets/images/drink3.jpg',scale: 1.6,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 10, right: 15),
                      width: 150,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Orange Juice'),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Text('Minuman segar yang dihasilkan dari perasan buah jeruk yang nikmat')
                        ],
                      ),
                    ),
                  ],
                ),

              ]
          ),
        )
    );
  }
}
