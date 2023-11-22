import 'package:flutter/material.dart';
import 'package:recipedia/view/home_page_view.dart';
import 'package:recipedia/controls/db_helper.dart';
import 'package:recipedia/view/register.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> _account = [];
  bool _isLoading = true;
  bool accountFound = false;
  bool _passwordVisible = false;

  Future<void> _refreshAccountData() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _account = data;
      _isLoading = false;
    });
  }

  @override
  void initState(){
    super.initState();
    _refreshAccountData();
  }

  void _validate() async {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }

    await _refreshAccountData();

    print("..number of items ${_account.length}");

    _account.forEach((e) {
      if (e['email'] == _emailController.text && e['password'] == _passwordController.text){
        accountFound = true;
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => HomePage(name: e['username'], email: e['email'], password: e['password'])),
        );
      }

      //UNTUK TESTING DELETE AKUN

      // SQLHelper.deleteDog(e['id']);
      // print("deleted" + e['username']);

    });
    if (!accountFound) showAlertDialog(context);
  }

  showAlertDialog(BuildContext context) {
    Widget tryAgainButton = TextButton(
      child: Text("TRY AGAIN"),
      onPressed: () {
        Navigator.of(context).pop();
        return;
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Couldn't find your account!"),
      content: Text("Email or password might wrong, try again!"),
      actions: [
        tryAgainButton,
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildImage(),
          _buildButton(context)
        ],
      ),
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



  Widget _buildButton(BuildContext context) {
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
                    labelStyle: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 300,
            height: 120,
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
          SizedBox(height: 20),
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
          SizedBox(
            child:  TextButton(
              child: const Text('Doesn\'t have any account yet? register here'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.3
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
    );
  }

}
