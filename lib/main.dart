import 'package:flutter/material.dart';
import 'package:recipedia/view/home_page_view.dart';
import 'package:recipedia/view/landing_page_view.dart';
import 'package:recipedia/view/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: LandingPage()//home: ,
    );
  }
}
