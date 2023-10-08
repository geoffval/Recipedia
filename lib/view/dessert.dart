import 'package:flutter/material.dart';

class DessertScreen extends StatelessWidget {
  const DessertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Dessert'),
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
                      padding: EdgeInsets.only(top:20, left: 25),
                      width: 150,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(right: 30)),
                          Image.asset('assets/images/dessert1.jpg', scale: 1.6,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 10),
                      width: 150,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Pancake'),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text('Hidangan pancake yang  lembut dengan maple sirup yang lezat')
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
                          Image.asset('assets/images/dessert2.jpg',scale: 1.7,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 4, right: 15),
                      width: 150,
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Waffle'),
                          Padding(padding: EdgeInsets.only(top: 10,right: 15)),
                          Text('Hidangan waffle yang renyah diluar dan lembut didalam dengan tambahan buah blueberry dan strawberry yang segar')
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
                          Image.asset('assets/images/dessert3.jpg',scale: 1.6,
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
                          Text('Pudding'),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text('Hidangan pudding yang lembut dan sangat lezat')
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
