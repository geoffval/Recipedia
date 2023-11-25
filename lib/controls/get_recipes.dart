import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetRecipes extends StatelessWidget {
  final String documentId;

  GetRecipes({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');

    return FutureBuilder<DocumentSnapshot>(
      future: recipes.doc(documentId).get(),
      builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
        snapshot.data!.data() as Map<String, dynamic>;
        return Container(
          child: Column(
            children: [
              Text('Name: ${data['name']}'),
              Text('Description: ${data['description']}')
            ],
          ),
        );
        }
      return const Text('Loading');
      }),
    );
  }
}