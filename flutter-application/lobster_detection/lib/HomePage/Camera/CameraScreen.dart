import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lobster_detection/HomePage/Camera/BoundingBox.dart';
import 'package:lobster_detection/HomePage/Camera/Camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

const String ssd = "ssd MobileNet"; // Name of the Model in the quotes
// typedef void Callback(List<dynamic> list, int h, int w); // Callback

class CameraScreen extends StatefulWidget {
  // Camera Module
  final List<CameraDescription> cameras;
  // final Callback setRecognitions;
  // final String model;

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
  loadModel() async {
    String modelResult;

    switch (_model) {
      case ssd:
        modelResult = await Tflite.loadModel(
            labels: "assets/labels.txt", // Add the location of .txt model in the quotes
            model: "assets/lobster_detection" // Add the location of .tflite model in the quotes
            );
    } // switch
    print(modelResult);
  } // loadModel Function

  onSelectModel(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: _model == ""
          ? Container()
          : Stack(
              children: [
                Camera(widget.cameras, _model, setRecognitions),
                BoundingBox(
                    _recognitions == null ? [] : _recognitions,
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.width,
                    screen.height,
                    _model)
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onSelectModel(ssd);
        },
        child: Icon(Icons.photo_library),
        backgroundColor: Colors.red,
      ),
    );
  }
} // Class
