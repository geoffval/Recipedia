import 'package:flutter/material.dart';
import 'package:recipedia/view/text_about.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('About'),
          actions: <Widget>[
            Padding(padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.info)
            )
          ],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 200,
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo_recipedia.png')
                      ],
                    ),
                  ),
                ],
              ),
              TextAbout()
            ]
        ),
      ),
    );
  }
}
