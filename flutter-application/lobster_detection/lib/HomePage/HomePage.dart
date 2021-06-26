import 'package:camera/Camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lobster_detection/HomePage/Camera/CameraScreen.dart';
import 'package:google_fonts/google_fonts.dart';

List<CameraDescription> cameras; // camera.dart file

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              print('IconButton pressed ...');
            },
            icon: Icon(
              Icons.flash_off,
              color: Color(0xFFFFFFFF),
              size: 30,
            ),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              print('IconButton pressed ...');
            },
            icon: Icon(
              Icons.help_sharp,
              color: Color(0xFFFFFFFF),
              size: 30,
            ),
            iconSize: 30,
          )
        ],
        centerTitle: true,
        elevation: 4,
      ), //Appbar

      // For temporary purpose, I am using floating action button for now,
      // but later it can be removed and changed to camera button

      body: Center(
          child: Text(
        'Press the button below to access Camera',
        style: GoogleFonts.robotoMono(
          textStyle: TextStyle(fontSize: 14),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraScreen(cameras),
            ),
          );
        },
        child: const Icon(Icons.photo_camera),
        backgroundColor: Colors.red,
      ),
    ); // Scaffold
  } // Widget

} // Class
