import 'package:flutter/material.dart';

class TextAbout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30,right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Recipedia is an application that provides a list of food recipes. In this application you can add and edit food recipes. ',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 70)),
          Text(
            'This app is designed by :',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          Text(
            '1.Nathanael Nelson (825210013)',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            '2.Julio Lim (825210020)',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            '3.Geoffrey Valhart (825210040)',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            '4.Andy Wijaya (825210077)',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      )
    );
  }
}