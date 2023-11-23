import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipedia/main.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});


  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  bool loggedIn = false;
  late String name;

  // final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');


  // List<String> data = [];
  //
  // Future<void> getUserData(String userId) async {
  //   try {
  //     DocumentSnapshot userSnapshot = await usersCollection.doc(userId).get();
  //
  //     if (userSnapshot.exists) {
  //       // User data exists
  //       Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
  //       print('User Data: $userData');
  //     } else {
  //       // User not found
  //       print('User not found in the database');
  //     }
  //   } catch (e) {
  //     print('Error getting user data: $e');
  //   }
  // }


  // Mendapatkan data user
  // Future<void> Data() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .where("userid", isEqualTo: user?.uid)
  //       .get()
  //       .then((ds) {
  //     print(ds);
  //   });
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: Text('ACCOUNT'),
          backgroundColor: Colors.grey[100],
          actions: <Widget>[
            Padding(padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.account_box)
        )
      ]
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildLoginForm(userData)
                ],
              ),
            );
          } else if(snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      )
    );
  }

  Widget _buildSucess(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.check, color: Colors.orangeAccent),
        Text('HI $name')
      ],
    );
  }

  showAlertDialog(BuildContext context) {
      Widget noButton = TextButton(
        child: Text("No"),
        onPressed: () {
          Navigator.of(context).pop();
          return;
        },
      );

      Widget yesButton = TextButton(
        child: Text("Yes"),
        onPressed: () async {
          Navigator.of(context).pop();
          await FirebaseAuth.instance.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
        },
      );

      AlertDialog alert = AlertDialog(
        title: Text("You are about to logout"),
        content: Text("Are you sure?"),
        actions: [
          yesButton,
          noButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

  Widget _buildLoginForm(userData) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Icon(Icons.account_box, size:200),
                ]
            ),
            TextFormField(
              initialValue: userData['username'],
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(

              initialValue: userData['email'],
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              initialValue: userData['password'],
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                      )),
                    ),
                    child: Text('Edit')
                ),
                SizedBox(width: 30),
                ElevatedButton(
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      )),
                    ),
                    child: Text('Logout')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
