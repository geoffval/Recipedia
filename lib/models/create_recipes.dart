import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class Recipes {

  static Future<void> loadData(String name, String desc, String type) async {
    final user = FirebaseAuth.instance.currentUser!.email;
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
    var uuid = const Uuid();

    usersCollection.doc(user).collection('recipes').doc(uuid.v1()).set({
      'name' : name,
      'desc' : desc,
      'type' : type
    });


  }
}