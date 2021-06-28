import 'dart:io';
import 'package:camera/Camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lobster_detection/HomePage/Camera/CameraScreen.dart';
import 'package:image_picker/image_picker.dart';

File _imageFile;

List<CameraDescription> cameras; // camera.dart file

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future selectImage() async {
    final picker = ImagePicker();
    var image =
        await picker.getImage(source: ImageSource.gallery, maxHeight: 300);
    setState(() {
      if (image != null) {
        _imageFile = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
            key: Key('flashIcon'),
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
            key: Key('helpIcon'),
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

      body: Center(
        child: Column(
          children: [
            Container(
              key: Key('imageContainer'),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: (_imageFile != null)
                  ? Image.file(_imageFile)
                  : Image.asset('assets/icons/sample_picture.jpg'),
            ),
            ElevatedButton(
              key: Key('uploadButton'),
              onPressed: () {
                selectImage();
              },
              child: Icon(
                Icons.file_upload_outlined,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('camereButton'),
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
