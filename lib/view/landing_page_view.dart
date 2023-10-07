import 'package:flutter/material.dart';
import 'package:recipedia/view/home_page_view.dart';
import 'package:recipedia/view/login.dart';
import 'package:recipedia/view/register.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
      padding: EdgeInsets.only(top:50,bottom:50),
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
        SizedBox(
          width: 170,
          height: 60,
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginPage())
              );
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
        const SizedBox(height: 20),
        SizedBox(
          width: 170,
          height: 60,
          child: ElevatedButton (
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RegisterPage())
              );
            },
            child: Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
            ),
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
          )
        ),
        SizedBox(height: 30),
        SizedBox(
          height: 30,
          child: Text(
            'or',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          child:  TextButton(
            child: const Text('Enter as Guest'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationThickness: 1.3
              ),
            ),
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage(name: 'Guest',email:'',password: '',)),
              );
            },
          ),
        )
      ],
    );
  }

}
