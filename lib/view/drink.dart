import 'package:flutter/material.dart';

class DrinkScreen extends StatefulWidget {
  const DrinkScreen({super.key});

  @override
  State createState() => _DrinkScreenState();
}


class _DrinkScreenState extends State<DrinkScreen> {
  final scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('DRINK'),
            actions: <Widget>[
              Padding(padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.food_bank)
              ),
            ]
        ),
        body: buildScroll()
    );
  }

  Widget buildScroll() {
    return Scrollbar(
      child: ListView.builder(
          controller: scrollController,
          itemCount: 1,
          itemBuilder: (context, index) => buildList(index)
      ),
    );
  }

  Column buildList(int index) {
    return Column(
        children: [
          Container(
            height: 150,
            margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(200, 200, 200, 0.8)
            ),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(227, 233, 227, 1)
                    ),
                    width: 130,
                    height: 110,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/drink1.jpg')
                ),
                Expanded(
                    child: Container(
                      height: 135,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(227, 233, 227, 1)
                      ),
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Thai tea'),
                          SizedBox(height: 10),
                          Text('Minuman berupa campuran dari susu dan teh')
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 150,
            margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(200, 200, 200, 0.8)
            ),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(227, 233, 227, 1)
                    ),
                    width: 130,
                    height: 110,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/drink2.jpg')
                ),
                Expanded(
                    child: Container(
                      height: 135,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(227, 233, 227, 1)
                      ),
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Coffee Milkshake'),
                          SizedBox(height: 10),
                          Text('Minuman berupa paduan kopi dan coklat')
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 150,
            margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(200, 200, 200, 0.8)
            ),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(227, 233, 227, 1)
                    ),
                    width: 130,
                    height: 110,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/drink3.jpg')
                ),
                Expanded(
                    child: Container(
                      height: 135,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(227, 233, 227, 1)
                      ),
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Orange Juice'),
                          SizedBox(height: 10),
                          Text('Minuman segar yang dihasilkan dari perasan buah jeruk yang nikmat')
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 150,
            margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(200, 200, 200, 0.8)
            ),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(227, 233, 227, 1)
                    ),
                    width: 130,
                    height: 110,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/drink4.jpg')
                ),
                Expanded(
                    child: Container(
                      height: 135,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(227, 233, 227, 1)
                      ),
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bandrek Susu'),
                          SizedBox(height: 10),
                          Text('Minuman herbal berupa jahe yang dicampur dengan susu kental manis')
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 150,
            margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(200, 200, 200, 0.8)
            ),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(227, 233, 227, 1)
                    ),
                    width: 130,
                    height: 110,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/drink5.jpg')
                ),
                Expanded(
                    child: Container(
                      height: 135,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(227, 233, 227, 1)
                      ),
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Espresso'),
                          SizedBox(height: 10),
                          Text('Biji kopi yang diseduh dengan tekanan tinggi menghasilkan ekstrak kopi')
                        ]
                      ),
                    )
                ),
              ],
            ),
          ),


        ]
    );
  }
}
