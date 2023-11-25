import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class Recipes {

  static Future<void> createRecipes(String name, String desc, String type, List ingredients, List steps) async {
    final user = FirebaseAuth.instance.currentUser!.email;
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
    var uuid = const Uuid();

    if (type == '1') {
      type = 'food';
    }else if(type == '2'){
      type = 'drink';
    }else if(type == '3'){
      type = 'dessert';
    }else{type = 'pastries';}

    usersCollection.doc(user).collection('recipes').doc(uuid.v1()).set({
      'name' : name,
      'desc' : desc,
      'type' : type,
      'ingredients' : ingredients,
      'steps' : steps
    });


  }
}