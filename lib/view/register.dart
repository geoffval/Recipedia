import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipedia/controls/auth.dart';
import 'package:recipedia/view/login.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future _validate() async {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the home page after successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Auth()),
      );
    } catch (e) {
      print("Error registering user: $e");
      // Handle registration error if necessary
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(),
            _buildButton(context)
          ],
        ),
      )
    );
  }

  Widget _buildImage() {
    return Container(
        child: Align(
          alignment: FractionalOffset.center,
          child: Image.asset('assets/logo_recipedia.png', scale: 2.3),
        )
    );
  }

  Widget _buildButton(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Username',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _usernameController,
                  validator: (text) {
                    if (text!.isEmpty){
                      return 'Enter username!';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                      labelStyle: TextStyle(fontSize: 12)
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 300,
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _emailController,
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
                      labelStyle: TextStyle(fontSize: 12)
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 300,
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  validator: (text) {
                    if (text!.isEmpty){
                      return 'Enter password!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                      labelText: 'Enter your password',
                      labelStyle: TextStyle(fontSize: 12),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 170,
            height: 60,
            child: ElevatedButton(
              onPressed: (){_validate();},
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
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Already a member?"),
              SizedBox(
                child:  TextButton(
                  child: const Text('Login here'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    );
                  },
                ),
              )
            ],
          )
        ],
      )
    );
  }

}
