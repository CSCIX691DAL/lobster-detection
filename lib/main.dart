import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lobster_detection/HomePage/splashPage.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'HomePage/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lobster Detection',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.deepOrange,

        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ).copyWith(
          secondary: Colors.red,
        ),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),

      ),
      home: splashRouting(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class splashRouting extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<splashRouting> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
          () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => splashPage(),
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
              Image.asset('assets/lobster.png', height: 200.0),

              SizedBox(height: 50.0),

              SpinKitThreeBounce(color: Colors.red),
            ]
        )
    );
  }
}
