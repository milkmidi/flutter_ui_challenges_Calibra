import 'package:calibra/screens/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          floatingActionButton: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RaisedButton(
                    // shape: ShareB Radius.circular(20.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {},
                    child: Text("Menu"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 0, top: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.question_answer,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 243, 244, 251),
          body: Home(),
        ),
      ),
    );
  }
}
