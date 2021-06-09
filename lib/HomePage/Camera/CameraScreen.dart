import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

const String ssd = "ssd MobileNet"; // Name of the Model in the quotes

class CameraScreen extends StatefulWidget {
  // Camera Module
  final List<CameraDescription> cameras;
  CameraScreen(this.cameras);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // Variables
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  // Function to load the model
  loadModel() async{
  String modelResult;

  switch(_model){
    case ssd:
      modelResult = await Tflite.loadModel(
          labels: "assets/",                  // Add the location of .txt model in the quotes
          model: "assets/"                    // Add the location of .tflite model in the quotes
      );
    } // switch
    print(modelResult);
  } // loadModel Function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // If the model is empty, it will load the container.
      // If the model is not enpty, it will load the stack.
      body: _model == "" ? Container() : Stack(
        children: [],
      ),  // Stack
      // For temporary purpose, I am using floating action button for now,
      // but later it can be removed and changed to camera button

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // Rounded Camera Icon. More details of the icon can be found in package: flutter/src/material/icons.dart package.
        child: Icon(Icons.photo_camera_rounded),
      ),
    );  // Scaffold
  } // Widget
} // Class