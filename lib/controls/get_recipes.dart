import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipedia/models/edit_recipes.dart';

FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
Size size = view.physicalSize;
double width = size.width;
double height = size.height;

class GetRecipes extends StatelessWidget {
final String documentId;
final String type;
final bool details;

GetRecipes({required this.documentId,required this.type, required this.details});

final user = FirebaseAuth.instance.currentUser!;

@override
Widget build(BuildContext context) {

  CollectionReference recipes = FirebaseFirestore.instance.collection('users').doc(user.email).collection('recipes');

  return FutureBuilder<DocumentSnapshot>(
    future: recipes.doc(documentId).get(),
    builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic>? data = snapshot.data?.data() as Map<String, dynamic>?;

        //This has to be like a very bad and hacky workaround, but no time to find another solution
        if (data != null && data['type'] == type && details == false) { //Full list with ingredients and steps
          return Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
               child: ListTile(
                   title: Text('${data['name']}',
                       style: TextStyle(
                         fontFamily: 'Roboto',
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                       )
                   ),
                   subtitle: Text(
                       '${data['desc']}',
                       softWrap: true,
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis // Enable text wrapping
                   ),
               ),
          );
        }if (data != null && data['type'] == type && details == true) { // Full list with ingredients and steps
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Text(
                          '${data['name']}',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          '${data['desc']}',
                          softWrap: true,
                          maxLines: 34,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 5, 20),
                        child: Text(
                          'Ingredients: ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          for (var step in data['ingredients'])
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    ' - $step',
                                    softWrap: true,
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    String editedData = await showDialog(
                                      context: context,
                                      builder: (context) => EditDataDialog(initialData: step),
                                    );

                                    if (editedData != null) {
                                      // Handle the edited data
                                      print('Edited data: $editedData');
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 5, 20),
                        child: Text(
                          'Steps: ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          for (int index = 0; index < data['steps'].length; index++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    ' - ${data['steps'][index]}',
                                    softWrap: true,
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    String editedData = await showDialog(
                                      context: context,
                                      builder: (context) => EditDataDialog(initialData: data['steps'][index]),
                                    );
                                    // Update DATA
                                    print(editedData);
                                    if (editedData != null) {
                                      updateRecipe(context,index, editedData);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }
      return Container();
    }),
  );
}


// UPDATE RECIPE
  void updateRecipe(BuildContext context, int index, String editedData) async {
    // Reference to the document
    DocumentReference recipeDocRef = FirebaseFirestore.instance.collection('users').doc(user.email).collection('recipes').doc(documentId);

    // Get the current array
    List<dynamic> currentSteps = (await recipeDocRef.get()).get('steps');

    // Update the array with the new data
    currentSteps[index] = editedData;

    // Update the document with the modified array
    await recipeDocRef.update({'steps': currentSteps});
    Navigator.pop(context);
  }
}