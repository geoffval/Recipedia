import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipedia/controls/get_recipes.dart';
import 'package:recipedia/view/recipes_detail.dart';

class DessertScreen extends StatefulWidget {
  const DessertScreen({super.key});

  @override
  State createState() => _DessertScreenState();
}

class _DessertScreenState extends State<DessertScreen> {
  final scrollController = ScrollController();
  final user = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection('users');
  TextEditingController searchQueryController = TextEditingController();

  // Document IDs
  List<String> docIDs = [];

  Map<String, dynamic> recipeDataMap = {};

  // Filtered document IDs
  List<String> filteredDocIDs = [];

  Future getDocId() async {
    docIDs.clear();
    recipeDataMap.clear(); // Clear the existing map

    await usersCollection.doc(user.email).collection('recipes').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
        String docID = document.reference.id;
        docIDs.add(docID);

        // Store the recipe data in the map
        recipeDataMap[docID] = document.data() as Map<String, dynamic>;
      }),
    );
    // Filter recipes based on the search query
    filterRecipes(searchQueryController.text);
  }

  void filterRecipes(String query) {
    filteredDocIDs = docIDs
        .where((docID) {
      // Retrieve the recipe data for the current docID
      Map<String, dynamic>? recipeData =
      recipeDataMap[docID]; // Ensure recipeDataMap is initialized
      if (recipeData != null) {
        // Check if the recipe name contains the search query
        return recipeData['name']
            .toLowerCase()
            .contains(query.toLowerCase());
      }
      return false;
    })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('DESSERT'),
        backgroundColor: Colors.grey[100],
        actions: const <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.food_bank),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearch(),
            _buildScroll(),
          ],
        ),
      ),
    );
  }

  Widget _buildScroll() {
    return Scrollbar(
      child: FutureBuilder(
        future: getDocId(),
        builder: (context, snapshot) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            controller: scrollController,
            itemCount: filteredDocIDs.length,
            itemBuilder: (context, index) => buildList(index),
          );
        },
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          border: Border.all(width: .8)
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.black54),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: searchQueryController,
              onChanged: (query) {
                setState(() {
                  filterRecipes(query);
                });
              },
              decoration: InputDecoration(
                  hintText: 'Search recipes...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black54)
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                RecipeDetails(docID: filteredDocIDs[index], title: "dessert"),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GetRecipes(
            documentId: filteredDocIDs[index],
            type: "dessert",
            details: false,
          ),
        ],
      ),
    );
  }

}
