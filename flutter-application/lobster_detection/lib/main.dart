import 'package:flutter/material.dart';
import 'package:lobster_detection/firstScreen.dart';
import 'home_page.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
          () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirstScreen(),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/icons/256.png', height: 200.0),

              SizedBox(height: 50.0),

              SpinKitThreeBounce(color: Colors.red),
            ]
        )
    );
  }
}