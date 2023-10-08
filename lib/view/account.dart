import 'package:flutter/material.dart';

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

  bool loggedIn = false;
  late String name;


  void _validate(){
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }

    final name= _nameController.text;
    final email = _emailController.text;
    final password = _passwordController;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          title: Text('Account'),
          backgroundColor: Colors.indigo
          , actions: <Widget>[
        Padding(padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.account_box)
        )
      ]
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  child: Icon(Icons.arrow_back_outlined),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 20,),
                Text("ACCOUNT")
              ],
            ),
            _buildLoginForm()
          ],
        ),
      ),
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

  Widget _buildLoginForm() {
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
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _validate,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )),
                ),
                child: Text('Save')
            ),
          ],
        ),
      ),
    );
  }
}
