import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future<void> sendPasswordReset() async {
    final email = _emailController.text.trim();

    try {
      // Query the usersCollection to check if the email exists
      final querySnapshot = await usersCollection.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Email is registered, send password reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

        // Show a success message or navigate to a success page
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Password Reset Email Sent'),
            content: Text('A password reset email has been sent to $email. Please check your inbox.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Email is not registered
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Email Not Found'),
            content: Text('The email $email is not registered. Please check the email address and try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Handle other errors
      print('Error sending password reset email: $error');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
           child: Text("Enter your email and we will send you password reset link", textAlign: TextAlign.center,
           style: TextStyle(fontSize: 20),),
         ),
         Container(
           width: 300,
           height: 120,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               TextFormField(
                 controller: _emailController,
                 keyboardType: TextInputType.emailAddress,
                 validator: (text) {
                   if (text!.isEmpty){
                     return 'Enter email!';
                   }
                   final regex = RegExp('[^@]+@[^\.]+\..+');
                   if (!regex.hasMatch(text)) {
                     return 'Enter a valid email!';
                   }
                   return null;
                 },
                 decoration: const InputDecoration(
                   border: UnderlineInputBorder(),
                   labelText: 'Enter your email',
                   labelStyle: TextStyle(fontSize: 14),
                   hintText: 'example@gmail.com', hintStyle: TextStyle(color: Colors.grey),
                 ),
               ),
             ],
           ),
         ),
          SizedBox(
            width: 170,
            height: 60,
            child: ElevatedButton(
              onPressed: (){
                sendPasswordReset();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )
                  )
              ),
              child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ),
       ],
      )
    );
  }
}
