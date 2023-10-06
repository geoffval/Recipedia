import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:recipedia/view/home_page_view.dart';
import 'package:recipedia/view/landing_page_view.dart';
=======
import 'package:recipedia/view/login.dart';
>>>>>>> 7cacacb69e3d29494692c7539241716e72b76c78

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage() //home: ,
=======
      home: LoginPage()//home: ,
>>>>>>> 7cacacb69e3d29494692c7539241716e72b76c78
    );
  }
}
