import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetRecipes extends StatelessWidget {
final String documentId;
final String type;
final bool list;
final bool title;

GetRecipes({required this.documentId,required this.type, required this.title,required this.list});


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
        if (data != null && data['type'] == type && list == false && title == false) { //Full list with ingredients and steps
          return Container(
              // padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
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
                        Text('Description: ${data['desc']}'),
                      ],
                    ),
                  )
              )
          );
        } else if (data != null && data['type'] == type && list == true){ //Title only
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${data['desc']}'),
              ],
            ),
          );
        } else if (data != null && data['type'] == type && list == false && title == true){ //Description only
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${data['name']}'),
              ],
            ),
          );
        }
      }
      return Container();
    }),
  );
}
}