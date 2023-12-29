import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteRecipe {
  static Future<void> deleteRecipe(BuildContext context, String documentId) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You are about to delete this recipe.'),
          content: const Text('Are you sure you want to delete this recipe?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel the delete operation
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm the delete operation
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmDelete == null || !confirmDelete) {
      return; // Cancel the delete operation
    }


    try {
      final user = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.email)
          .collection('recipes')
          .doc(documentId)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Recipe deleted successfully'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.of(context).pop();

    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error $error'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}