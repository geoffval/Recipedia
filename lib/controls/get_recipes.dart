import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
Size size = view.physicalSize;
double width = size.width;
double height = size.height;

class GetRecipes extends StatelessWidget {
final String documentId;
final String type;
final bool details;

GetRecipes({required this.documentId,required this.type, required this.details});


@override
Widget build(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser!;
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
        }if (data != null && data['type'] == type && details == true) { //Full list with ingredients and steps
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
                          child: Text('${data['name']}',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(
                            Icons.edit,
                            color: Colors.grey
                        )
                    )
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
                          child: Text('${data['desc']}',
                              softWrap: true,
                              maxLines: 34,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                              )
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(
                            Icons.edit,
                            color: Colors.grey
                        )
                    )
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
                          child: Text('Ingredients: ',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        )
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 20, 20),
                          child: Text('${data['ingredients']}\n',
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                              )
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(
                            Icons.edit,
                            color: Colors.grey
                        )
                    )
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
                          child: Text('Steps: ',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        )
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 20, 20),
                          child: Text('${data['steps']}\n',
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                              )
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(
                            Icons.edit,
                            color: Colors.grey
                        )
                    )
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
}