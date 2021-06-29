import 'package:camera/Camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

List<CameraDescription> cameras; // camera.dart file

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<MyHomePage> {

  // Variables for Camera
  bool isWorking = false;
  String result = "";
  CameraController cameraController;
  CameraImage cameraImage;


  loadModel() async {
    await Tflite.loadModel(
        model: "assets/lobster_detection.tflite",
      labels: "assets/labels.txt",
    );
}

  initCamera(){
    // Creates a new Camera
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {

      if(!mounted){
        return;
      }

      setState(() {
        cameraController.startImageStream((imageStreaming) => {
          // If Camera is not busy with some other function
          if(!isWorking){
            isWorking = true,
            cameraImage = imageStreaming,
            runModelOnStreamFrames(),
          }


        }); // imageStreaming
      }); // setState
    }); // cameraController initialize
  } // initCamera()

  // Running Model in Live Stream
runModelOnStreamFrames() async {
if(cameraImage != null){
  var recognitions = await Tflite.runModelOnFrame(
      bytesList: cameraImage.planes.map((plane)
          {
            return plane.bytes;
          }).toList(),

          imageHeight: cameraImage.height,
          imageWidth: cameraImage.width,
          imageMean: 125.75,
          imageStd: 127.5,
          rotation: 90,   // Android Only
          numResults: 2,  // Display number of Results
          threshold: 0.1,
          asynch: true,
      );

      result = " ";

      recognitions.forEach((response) {
        result += response["label"] + " " + (response["confidence"] as double).toStringAsFixed(2) + "\n\n";

        });
      setState(() {
        result;
      });

      isWorking = false;
  }
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadModel();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();

    await Tflite.close();
    cameraController?.dispose();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
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
      ), //Appbar

      // For temporary purpose, I am using floating action button for now,
      // but later it can be removed and changed to camera button

      body: Container(
              child: Center(
                child: TextButton(
                  onPressed: (){
                    initCamera();
                  },
                  child: Container(
                    child: cameraImage == null ? Container(
                      child: Icon(Icons.photo_camera_front, color: Colors.deepOrange, size: 50,),
                    )
                  : AspectRatio(

                      aspectRatio: cameraController.value.aspectRatio,
                      child: CameraPreview(cameraController),
                    ),

                  ),  // Container
                ),  // TextButton
              ),  // Center
            ) // Container
          // const Center(child: Text('Press the button below to access Camera')),

    ); // Scaffold
  } // Widget

} // Class














// floatingActionButton: FloatingActionButton(
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CameraScreen(cameras),
//       ),
//     );
//   },
//   child: const Icon(Icons.photo_camera),
//   backgroundColor: Colors.red,
// ),