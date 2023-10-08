import 'package:flutter/material.dart';

class DessertScreen extends StatefulWidget {
  const DessertScreen({super.key});

  @override
  State createState() => _DessertScreenState();
}


class _DessertScreenState extends State<DessertScreen> {
  final scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('DESSERT'),
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
                    child: Image.asset('assets/images/dessert1.jpg')
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
                          Text('Pancake'),
                          SizedBox(height: 10),
                          Text('Hidangan pancake yang  lembut dengan maple sirup yang lezat')
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
                    child: Image.asset('assets/images/dessert2.jpg')
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
                          Text('Waffle'),
                          SizedBox(height: 10),
                          Text('Hidangan waffle yang lembut dengan tambahan buah yang segar')
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
                    child: Image.asset('assets/images/dessert3.jpg')
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
                          Text('Pudding'),
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
                    child: Image.asset('assets/images/dessert4.jpg')
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
                          Text('Pie'),
                          SizedBox(height: 10),
                          Text('Pie yang lembut dengan tambahan buah-buahan segar')
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
                    child: Image.asset('assets/images/dessert5.jpg')
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
                            Text('Salad'),
                            SizedBox(height: 10),
                            Text('Hidangan penutup berupa potongan sayuran yang nikmat')
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
