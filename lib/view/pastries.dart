import 'package:flutter/material.dart';

class PastriesScreen extends StatelessWidget {
  const PastriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Pastries'),
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
                      padding: EdgeInsets.only(top:10, left: 25),
                      width: 150,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(right: 30)),
                          Image.asset('assets/images/pastries1.jpg', scale: 1.6,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 1),
                      width: 150,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Butter Croissant'),
                          Padding(padding: EdgeInsets.only(top: 1)),
                          Text('Hidangan Croissant yang renyah diluar dan lembut didalam ')
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
                          Image.asset('assets/images/pastries2.jpg',scale: 1.7,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 10, right: 15),
                      width: 150,
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Chicken & Mushroom Pie'),
                          Padding(padding: EdgeInsets.only(top: 10,right: 15)),
                          Text('Hidangan Pie yang sangat lezat perpaduan antara ayam dan jamur ')
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
                          Image.asset('assets/images/pastries3.jpg',scale: 1.6,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 2, right: 15),
                      width: 150,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Cookies'),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text('Hidangan cookies yang renyah dengan choco chip yang lezat')
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
