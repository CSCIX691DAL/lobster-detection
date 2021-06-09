import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lobster_detection/HomePage/Camera/CameraScreen.dart';

List<CameraDescription> cameras;  // camera.dart file

class MyHomePage extends StatefulWidget{
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
        backgroundColor: Color(0xFF090000),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
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
      ),  //Appbar
    );  // Scaffold
  } // Widget
} // Class


Future<Null> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  // Try and Catch block to open camera
  try{
    cameras = await availableCameras();
  } catch (e) {
    print('Error Message: $e.message \n Error Code: $e.code');
  }
  runApp(new openCamera());
}

class openCamera extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CameraScreen(cameras),
    );
  }
}
