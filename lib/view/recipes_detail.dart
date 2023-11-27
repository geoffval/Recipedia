import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipedia/controls/get_recipes.dart';


class RecipeDetails extends StatefulWidget {
  final String docID;

  const RecipeDetails({super.key, required this.docID});


  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

 //final _recipeDetails = RecipeDetails();

class _RecipeDetailsState extends State<RecipeDetails> {
  final scrollController = ScrollController();
  final user = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  //String get _docID => _recipeDetails.docID;

  //Future getDocId() async{
  //  await usersCollection.doc(user.email).collection('recipes').get();
  //}

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
              buildPage(widget.docID)
            ],
          ),
        )
    );
  }

  Widget buildPage(String docID) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent[300],
            borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        child: GetRecipes(documentId: docID, type: "food", details: true),
    );
  }
}
