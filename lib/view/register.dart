import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 90,
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
          height: 90,
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
          height: 90,
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
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(fontSize: 12)
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 170,
          height: 60,
          child: ElevatedButton(
            onPressed: (){},
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
      ],
    );
  }

}
