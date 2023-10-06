import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          HomePageButtons(context)
        ],
      ),
    );
  }

  Widget HomePageButtons(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 100,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: null,
                    child: Icon(Icons.person)
                )
              ),
              SizedBox(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: null,
                      child: Icon(Icons.info)
                  )
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: null,
                      child: Icon(Icons.person)
                  )
              ),
              SizedBox(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: null,
                      child: Icon(Icons.info)
                  )
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: null,
                      child: Icon(Icons.person)
                  )
              ),
              SizedBox(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: null,
                      child: Icon(Icons.info)
                  )
              )
            ],
          )
        ],
      ),
    );
  }

}
