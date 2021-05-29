# Lobster Detection Mobile Application - CSCIX691 Summer 2021 - Dalhousie University 

## Background

### Team Members:
- Kanak Prajapati
- Kayleen Sung
- Liam Cormack
- Liam Osler
- Pulkit Garg
- Shawn Shahin Azar


### Project Requirements:
Detection of whether there is a lobster in the camera view with a generally accessible and aesthetically pleasing app.

### Proposed Solution:
- Collect a proper dataset of lobster photos.
- Label Images in CVAT or Roboflow Annotate.
- Export annotated data set to Darknet YOLOv4.
- Run dataset through roboflow training module.
- Export our trained images and bounding boxes in the YOLO Darknet format, using Roboflow.
- Convert YOLOv4 to TFlite’s weighted system.
- Write code to sort data from the API.
- Convert Darknet Model to TensorFlow Lite.
- Deploy on Device.


## Helpful Links and Resources:

### Dart documentation:
https://dart.dev/guides

https://dart.dev/get-dart


### Flutter documentation:
https://flutterflow.io/

https://flutter.dev/docs/get-started/install


### TensorFlow Lite (TFlite):
https://www.tensorflow.org/lite/guide

https://pub.dev/packages/tflite


### Material UI:
https://material.io/components


### YOLOv4:
https://github.com/pjreddie/darknet



### Video lessons and tutorials:
[YouTube - Installing Flutter on Mac - Nick Manning (seenickcode)](https://www.youtube.com/watch?v=THsihXK1-14)

[YouTube - Flutter Course - Full Tutorial for Beginners (Build iOS and Android Apps) - freeCodeCamp.org](https://www.youtube.com/watch?v=pTJJsmejUOQ)

[YouTube - Flutter: Build a Beautiful Pokemon App | Animation | Widgets | JSON API - mtechviral](https://www.youtube.com/watch?v=yeXJqZCiwTQ&t=480s)

[YouTube - Flutter iOS & Android Object Detection with TensorFlow Lite Deep Learning & Machine Learning Course - Coding Cafe](https://youtube.com/playlist?list=PLxefhmF0pcPmynNry6IksRAx0vNRns7Q1)

[YouTube - How to Train YOLOv4 on a Custom Dataset (PyTorch) - Roboflow](https://www.youtube.com/watch?v=9hVgyeI4g4o)


### Other documentation and resources:
[Curiousily- Object detection on a custom dataset](https://curiousily.com/posts/object-detection-on-custom-dataset-with-yolo-v5-using-pytorch-and-python/)
