import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipedia/view/forgotpw.dart';
import 'package:recipedia/view/register.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  Future _validate() async {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
           _buildForm(context)
         ],
       ),
      )
    );
  }

  Widget _buildImage() {
    return Container(
        padding: EdgeInsets.only(top:20),
        child: Align(
          alignment: FractionalOffset.center,
          child: Image.asset('assets/logo_recipedia.png', scale: 2),
        )
    );
  }


  Widget _buildForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            width: 300,
            height: 120,
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
                )
              ],
            ),
          ),
          Container(
            width: 300,
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
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(fontSize: 14),
                    hintText: 'Password must be 6 letter length or more',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
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
                  validator: (text) {
                    if (text!.isEmpty){
                      return 'Enter password!';
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  TextButton(
                    child: const Text('Forgot Password?'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                      );
                    },
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 170,
            height: 60,
            child: ElevatedButton(
              onPressed: (){
                _validate();
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
                  'LOGIN',
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
              Text("Not a member?"),
              SizedBox(
                child:  TextButton(
                  child: const Text('Register here'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => RegisterPage()),
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
