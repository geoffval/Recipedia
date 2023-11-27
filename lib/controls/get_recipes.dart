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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text('${data['name']}',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                      )
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Text('${data['desc']}',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,

                      )
                    )
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Text('${data['ingredients']}',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          )
                      )
                  ),
                  Expanded(
                      flex: 2,
                      child: Text('${data['ingredients']}',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          )
                      )
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                  flex: 2,
                      child: Text('${data['steps']}',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      )
                  ))
                ],
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