import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetRecipes extends StatelessWidget {
final String documentId;

GetRecipes({required this.documentId});

@override
Widget build(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference recipes = FirebaseFirestore.instance.collection('users').doc(user.email).collection('recipes');

  return FutureBuilder<DocumentSnapshot>(
    future: recipes.doc(documentId).get(),
    builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic>? data = snapshot.data?.data() as Map<String, dynamic>?;

        if (data != null && data['type'] == 'food') {
          return Container(
            child: Column(
              children: [
                Text('Name: ${data['name']}'),
                Text('Description: ${data['desc']}'),
                Text('Ingredients: ${data['ingredients']}'),
                Text('Steps: ${data['steps']}'),
              ],
            ),
          );
        } else {
          // Handle the case where data is null
          return const Text('Data is null');
        }
      }

      return const Text('Loading');
    }),
  );
}
}