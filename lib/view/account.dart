import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {

  final String name;
  final String email;
  final String password;

  const AccountScreen({super.key, required this.name, required this.email, required this.password});


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
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
          title: Text('ACCOUNT'),
          actions: <Widget>[
            Padding(padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.account_box)
        )
      ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
              initialValue: widget.name,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(

              initialValue: widget.email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              initialValue: widget.password,
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
                child: Text('Edit')
            ),
          ],
        ),
      ),
    );
  }
}
