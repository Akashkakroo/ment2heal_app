// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:ment2heal/main.dart';
// import 'package:tflite/tflite.dart';

// class CameraText extends StatefulWidget {
//   const CameraText({Key? key}) : super(key: key);

//   @override
//   State<CameraText> createState() => _CameraTextState();
// }

// class _CameraTextState extends State<CameraText> {
//   CameraImage? cameraImage;
//   CameraController? cameraController;
//   String output = '';

//   loadCamera() {
//     cameraController = CameraController(cameras![0], ResolutionPreset.medium);
//     cameraController!.initialize().then((value) {
//       if (!mounted) {
//         return;
//       } else {
//         setState(() {
//           cameraController!.startImageStream((ImageStream) {
//             cameraImage = ImageStream;
//             runModel();
//           });
//         });
//       }
//     });
//   }

//   runModel() async {
//     if (cameraImage != null) {
//       var predictions = await Tflite.runModelOnFrame(
//         bytesList: cameraImage!.planes.map((plane) {
//           return plane.bytes;
//         }).toList(),
//         imageHeight: cameraImage!.height,
//         imageWidth: cameraImage!.width,
//         imageMean: 127.5,
//         imageStd: 127.5,
//         rotation: 90,
//         numResults: 2,
//         threshold: 0.1,
//         asynch: true,
//       );
//       predictions!.forEach((element) {
//         setState(() {
//           output = element['label'];
//         });
//       });
//     }
//   }

//   loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/model_unquant.tflite",
//       labels: "assets/labels.txt",
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
