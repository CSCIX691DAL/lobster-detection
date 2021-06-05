import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home:
        HomePage(), // Every instance of HomePage will have to configured to other pages
  ));
}

class HomePage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  late List _output;
  final _picker = ImagePicker();
  var _image = File('');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    // ignore: unnecessary_statements
    loadModel().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: <Widget>[
                  _image == null ? Container() : Image.file(_image),
                  SizedBox(
                    height: 16,
                  ),
                  _output == null
                      ? Text("Ready to Detect...")
                      : Text(_output[0]),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          chooseImage();
        },
        child: Icon(Icons.image),
      ),
    );
  }

  chooseImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);
    if (image == null)
      return null;
    else
      _image = File(image.path);
    setState(() {
      _isLoading = true;
      _image = image as File;
    });
    runModelOnImage(image);
  }

  runModelOnImage(image) {
    var image;
    Tflite.runModelOnImage(
        path: image.path,
        numResults: 1,
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.5);
    setState(() {
      _isLoading = false;
      _image = image;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/lobster_detection.tflite", labels: "assets/labels.txt");
  }
}
