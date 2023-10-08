import 'package:flutter/material.dart';

class PastriesScreen extends StatefulWidget {
  const PastriesScreen({super.key});

  @override
  State createState() => _PastriesScreenState();
}


class _PastriesScreenState extends State<PastriesScreen> {
  final scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('PASTRIES'),
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
                    child: Image.asset('assets/images/pastries1.jpg')
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
                          Text('Croissant'),
                          SizedBox(height: 10),
                          Text('Hidangan Croissant yang renyah diluar dan lembut didalam')
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
                    child: Image.asset('assets/images/pastries2.jpg')
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
                          Text('Chicken and Mushroom Pie'),
                          SizedBox(height: 10),
                          Text('Hidangan Pie yang sangat lezat perpaduan antara ayam dan jamur')
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
                    child: Image.asset('assets/images/pastries3.jpg')
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
                          Text('Cookies'),
                          SizedBox(height: 10),
                          Text('Hidangan cookies yang renyah dengan choco chip yang lezat')
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
                    child: Image.asset('assets/images/pastries4.jpg')
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
                          Text('Apricot Danish '),
                          SizedBox(height: 10),
                          Text('Pastry berlapis dengan rasa manis dan disajikan dalam tradisi viennoiserie')
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
                    child: Image.asset('assets/images/pastries5.jpg')
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
                            Text('Lemon Meringue Tarts'),
                            SizedBox(height: 10),
                            Text('Tart Lezat yang Membuat Lidah Bergoyang')
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
