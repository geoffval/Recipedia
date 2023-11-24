import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipedia/main.dart';
import 'package:recipedia/view/forgotpw.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  bool loggedIn = false;

  // Edit username Alert dialog
  Future<void> editData(String field, userData) async {
    String newValue = "";
    String originalValue =  userData[field];
      await showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text(
                  "Edit $field",
                ),
                content: TextField(
                  keyboardType: field == 'age' ? TextInputType.number : null,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: ("Enter new $field"),
                      hintStyle: const TextStyle(color: Colors.grey)
                  ),
                  onChanged: (value) {
                    newValue = value;
                  },
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        newValue = originalValue;
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(newValue);
                        },
                      child: const Text("Save")
                  ),
                ],
              )
      );
      if (newValue.trim().isNotEmpty) {
        await usersCollection.doc(user.email).update({field: newValue});
      } else {
        // Restore the original value if the user chose to cancel
        await usersCollection.doc(user.email).update({field: originalValue});
      }
  }

  // Logout Alert dialog
  showAlertDialog(BuildContext context) {
    Widget noButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
        return;
      },
    );

    Widget yesButton = TextButton(
      child: const Text("Yes"),
      onPressed: () async {
        Navigator.of(context).pop();
        await FirebaseAuth.instance.signOut();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("You are about to logout"),
      content: const Text("Are you sure?"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: const Text('ACCOUNT'),
          backgroundColor: Colors.grey[100],
          actions: const <Widget>[
            Padding(padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.account_box)
        )
      ]
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: usersCollection.doc(user.email).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildLoginForm(userData),
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


  Widget _buildLoginForm(userData) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  const Icon(Icons.person, size:90),
                  Text(userData['email'])
                ]
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(top: 5,left: 25,right: 15, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Username"),
                        IconButton(
                            onPressed: () => editData('username',userData),
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey
                            )
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(userData['username'],textAlign: TextAlign.left,)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(top: 5,left: 25,right: 15, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Age"),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => editData('age',userData),
                              icon: const Icon(
                                  Icons.edit,
                                  color: Colors.grey
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(userData['age']),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 150),
                ElevatedButton(
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      )),
                    ),
                    child: const Text('Logout')
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                      );
                      },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                    ),
                    child: const Text('Change Password',style: TextStyle(color: Colors.black))
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
