Lobster Detection Mobile Application - CSCIX691 Summer 2021 - Dalhousie University
Background
Team Members:
Kanak Prajapati
Kayleen Sung
Liam Cormack
Liam Osler
Pulkit Garg
Shawn Shahin Azar
Project Requirements:
Detection of whether there is a lobster in the camera view with a generally accessible and aesthetically pleasing app.

Proposed Solution:
Collect a proper dataset of lobster photos.
Label Images in CVAT or Roboflow Annotate.
Export annotated data set to Darknet YOLOv4.
Run dataset through roboflow training module.
Export our trained images and bounding boxes in the YOLO Darknet format, using Roboflow.
Convert YOLOv4 to TFlite’s weighted system.
Write code to sort data from the API.
Convert Darknet Model to TensorFlow Lite.
Deploy on Device.
Helpful Links and Resources:
Dart documentation:
https://dart.dev/guides

https://dart.dev/get-dart

Flutter documentation:
https://flutterflow.io/

https://flutter.dev/docs/get-started/install

TensorFlow Lite (TFlite):
https://www.tensorflow.org/lite/guide

https://pub.dev/packages/tflite

Material UI:
https://material.io/components

YOLOv4:
https://github.com/pjreddie/darknet

Kaggle image sets:
https://www.kaggle.com/kmader/food41

https://www.kaggle.com/sonvoutas/large-lobster-image-dataset

Video lessons and tutorials:
YouTube - Installing Flutter on Mac - Nick Manning (seenickcode)

YouTube - Flutter Course - Full Tutorial for Beginners (Build iOS and Android Apps) - freeCodeCamp.org

YouTube - Flutter: Build a Beautiful Pokemon App | Animation | Widgets | JSON API - mtechviral

YouTube - Flutter iOS & Android Object Detection with TensorFlow Lite Deep Learning & Machine Learning Course - Coding Cafe

YouTube - How to Train YOLOv4 on a Custom Dataset (PyTorch) - Roboflow

Other documentation and resources:
Curiousily- Object detection on a custom dataset
