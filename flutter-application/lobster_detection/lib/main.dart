import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';
import 'package:tensorflow_lite_flutter/SplashScreen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
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

// ignore: camel_case_types
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
          Image.asset(
            'assets/icons/lobster.png',
            height: 200.0,
          ),
          SizedBox(height: 50.0),
          SpinKitThreeBounce(color: Colors.red),
        ]));
  }
}
