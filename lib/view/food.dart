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
            actions: const <Widget>[
              Padding(padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.food_bank)
              ),
            ]
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildSearch(),
              _buildScroll(),
            ],
          ),
        )
    );
  }

  Widget _buildScroll() {
    return Scrollbar(
      child: ListView.builder(
        controller: scrollController,
        itemCount: 1,
        itemBuilder: (context, index) => buildList(index)
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.white,)
        ],
      ),
    );
  }

  Widget buildList(int index) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
    );
  }
}
