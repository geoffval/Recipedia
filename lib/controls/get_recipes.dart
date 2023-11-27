import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          return Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: ListTile(
                  title: Container(
                    child: Column(
                      children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Name: ${data['name']}',
                              style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16
                              )
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                          ],
                        ),
                        Flexible(child: OverflowBox(
                          maxHeight: 200,
                          alignment: Alignment.topLeft,
                          child: Text(
                              'Description: ${data['desc']}',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis // Enable text wrapping
                          ),
                        ))
                      ],
                    ),
                  )
              )
          );
        }if (data != null && data['type'] == type && details == true) { //Full list with ingredients and steps
          return Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: ListTile(
                  title: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Name: ${data['name']}',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 16
                                )
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                          ],
                        ),
                        Flexible(child: OverflowBox(
                          maxHeight: 200,
                          alignment: Alignment.topLeft,
                          child: Text(
                              'Description: ${data['desc']}',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis // Enable text wrapping
                          ),
                        ))
                      ],
                    ),
                  )
              )
          );
        }
      }
      return Container();
    }),
  );
}
}