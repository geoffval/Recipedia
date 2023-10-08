import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Food'),
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
                      padding: EdgeInsets.only(top:50, left: 25),
                      width: 150,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(right: 30)),
                          Image.asset('assets/nasgor.jpg', scale: 1.6,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 30),
                      width: 150,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Nasi Goreng Ayam'),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text('Nasi Goreng dengan irisan ayam suwir')
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
                          Image.asset('assets/ayammie.jpg',scale: 1.7,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 30, right: 15),
                      width: 150,
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Mie Ayam'),
                          Padding(padding: EdgeInsets.only(top: 10,right: 15)),
                          Text('Mie dengan aromatic oil dan ayam cincang')
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
                          Image.asset('assets/bakso.jpg',scale: 1.6,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(top: 30, right: 15),
                      width: 150,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Bakso'),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text('Bakso dengan daging sapi yang fresh')
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
