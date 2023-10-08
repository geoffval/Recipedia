import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State createState() => _FoodScreenState();
}


class _FoodScreenState extends State<FoodScreen> {
  final scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('FOOD'),
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
                      child: Image.asset('assets/images/food1.jpg')
                  ),
                  Expanded(
                    child: Container(
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
                        Text('Nasi Goreng Ayam'),
                        SizedBox(height: 10),
                        Text('Nasi Goreng dengan irisan ayam suwir')
                      ],
                    ),
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
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
                      child: Image.asset('assets/images/food2.jpg')
                  ),
                  Expanded(
                      child: Container(
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
                            Text('Mie Ayam'),
                            SizedBox(height: 10),
                            Text('Mie dengan aromatic oil dan ayam cincang')
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
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
                      child: Image.asset('assets/images/food3.jpg')
                  ),
                  Expanded(
                      child: Container(
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
                            Text('Bakso'),
                            SizedBox(height: 10),
                            Text('Bakso dengan daging sapi yang fresh')
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
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
                      child: Image.asset('assets/images/food4.jpg')
                  ),
                  Expanded(
                      child: Container(
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
                            Text('Sate ayam'),
                            SizedBox(height: 10),
                            Text('Sate ayam khas madura')
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
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
                      child: Image.asset('assets/images/food5.jpg')
                  ),
                  Expanded(
                      child: Container(
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
                            Text('Jamur Crispy'),
                            SizedBox(height: 10),
                            Text('Jamur putih yang digoreng dengan tepung')
                          ],
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
