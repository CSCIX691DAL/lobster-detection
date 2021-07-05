# tensorflow_lite_flutter

A flutter app to demonstrate usage of tensor flow lite ML.

![App Demo](pictures/image1.gif)
![Teachable Machine](pictures/image2.gif)

The "TensorFlow" model is trained using [Teachable Machines](https://teachablemachine.withgoogle.com/train). The model is trained with different texture colors of walls. App will recognize the color and classify the color according to best match. This app will load a pre-trained model and start classification on frames received from Camera Controller. App will show results in real-time along with confidence percentages.

Model can be downloaded from this [download link](https://drive.google.com/file/d/1IIUr2OVBKPS12rXb8F13n87Ypqj-9GBO/view?usp=sharing) and re-loaded on "Teachable Machines" website.

## Labels

| Class Id | Label Name |
| ------------- | ------------- |
| 0 | Black Texture  |
| 1  | Blue Texture  |
| 2  | Green Texture  |
| 3 | Orange Texture  |
| 4  | Pink Texture |
| 5  | Purple Texture  |
| 6  | Red Texture  |
| 7 | White Texture  |
| 8 | Yellow Texture  |

## Getting Started

Usage
Currently only Android platform is supported but work is going on for the iOS side, you can track the progress on its GitHub repo.

You can try out the app on your system by following these steps:

Clone this repo:

git clone : https://github.com/CSCIX691DAL/lobster-detection.git


## How to run this
Running this is as simple as it gets. Follow this steps
1. Open your terminal (NOTE: git bash prefered/ Terminal on VS Code)
2. Navigate to the project folder where you have cloned this repo.
3. Install Packages needed

```
flutter packages get
```

4. Open an emulator or plug in a real device
5. Type the following command in the terminal 
     ```
     flutter run
     ```
     

# flutter_realtime_detection

Real-time object detection in Flutter using [camera](https://pub.dartlang.org/packages/camera) and [tflite](https://pub.dartlang.org/packages/tflite) plugin. 


## Models


## Usage:


### iOS

iOS 10.0 of higher is needed to use the plugin. If compiling for any version lower than 10.0 make sure to check the iOS version before using the plugin. Change the minimum platform version to 10 (or higher) in your `ios/Podfile` file.

Add below permission to the `ios/Runner/Info.plist`:

- one with the key `Privacy - Camera Usage Description` and a usage description.

Or in text format add the key:

```xml
<key>NSCameraUsageDescription</key>
<string>Can I use the camera please?</string>
```

### Android

Change the minimum Android sdk version to 21 (or higher) in your `android/app/build.gradle` file.

```
minSdkVersion 21
```
# Installation :
First, add camera as a dependency in your pubspec.yaml file.

camera_camera: current_version


# Camera_helper class :
function called _initializeCamera() where we will get the list of available the cameras of the device, 
create the CameraController and finally start the ImageStream. Outside of the function, we also need to create 3 new variables: one for the CameraController, other for the CameraImage that we’re getting from the ImageStream and another for the initialization state of the camera.


```class CameraHelper {
  static CameraController camera;

  static bool isDetecting = false;
  static CameraLensDirection _direction = CameraLensDirection.back;
  static Future<void> initializeControllerFuture;

  static Future<CameraDescription> _getCamera(CameraLensDirection dir) async {
    return await availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }
```
Create a method called _initializeCamera(), and initialize the camera _controller inside it:

```

  static void initializeCamera() async {
    AppHelper.log("_initializeCamera", "Initializing camera..");


    camera = CameraController(
        await _getCamera(_direction),
        defaultTargetPlatform == TargetPlatform.iOS
            ? ResolutionPreset.low
            : ResolutionPreset.high,
        enableAudio: false);
    initializeControllerFuture = camera.initialize().then((value) {
      AppHelper.log(
          "_initializeCamera", "Camera initialized, starting camera stream..");


      camera.startImageStream((CameraImage image) {
        if (!TFLiteHelper.modelLoaded) return;
        if (isDetecting) return;
        isDetecting = true;
        try {
          TFLiteHelper.classifyImage(image);
        } catch (e) {
          print(e);
        }
      });
    });
  }
}
```
On the .startImageStream() function, it gets a CameraImage object as parameter. 
This object contains all the data regarding the image currently being captured by the camera. 





## TFLite Helper Class

```dart
    // Load Model
    static Future<String> loadModel() async{
        AppHelper.log("loadModel", "Loading model..");
    
        return Tflite.loadModel(
          model: "assets/model_unquant.tflite",
          labels: "assets/labels.txt",
        );
    }
    
    //Start Classification on CameraImage frames
    static classifyImage(CameraImage image) async {
    
        await Tflite.runModelOnFrame(
                bytesList: image.planes.map((plane) {
                  return plane.bytes;
                }).toList(),
                numResults: 5)
            .then((value) {
      
          //Send results
          tfLiteResultsController.add(_outputs);
        });
    }
```


# app_helper.dart :
