import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipedia/controls/get_recipes.dart';
import 'package:recipedia/view/recipes_detail.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final scrollController = ScrollController();
  final user = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  //document IDs
  List<String> docIDs = [];

  Future getDocId() async{
    //clears the list to prevent duplicates everytime getDocId gets called
    docIDs.clear();
    await usersCollection.doc(user.email).collection('recipes').get()
    .then(
        (snapshot) => snapshot.docs.forEach((document) {
          docIDs.add(document.reference.id);
        }),
    );
  }

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
      child: FutureBuilder(
          future: getDocId(),
          builder: (context, snapshot){
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: scrollController,
                itemCount: docIDs.length,
                itemBuilder: (context, index) => buildList(index)
            );
          },
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => RecipeDetails(docID: docIDs[index]))
        );
      },
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GetRecipes(documentId: docIDs[index], type: "food", details: false)
          ],
        ),
    );
  }

}
