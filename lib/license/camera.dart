//import 'dart:io';
//import 'package:flutter_image_compress/flutter_image_compress.dart';
//import 'package:image_cropper/image_cropper.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:flutter/material.dart';
//
//class CameraScreen extends StatefulWidget {
//  @override
//  _CameraScreenState createState() => _CameraScreenState();
//}
//
//class _CameraScreenState extends State<CameraScreen> {
//  File _image;
//
//  getImageFile(ImageSource source) async {
//
//    //Clicking or Picking from Gallery
//
//    var image = await ImagePicker.pickImage(source: source);
//
//    //Cropping the image
//
//    File croppedFile = await ImageCropper.cropImage(
//      sourcePath: image.path,
////      ratioX: 1.0,
////      ratioY: 1.0,
//      maxWidth: 512,
//      maxHeight: 512,
//    );
//
//    //Compress the image
//
//    var result = await FlutterImageCompress.compressAndGetFile(
//      croppedFile.path,
//      croppedFile.path,
//      quality: 50,
//    );
//
//    setState(() {
//      _image = result;
//      print(_image.lengthSync());
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    print(_image?.lengthSync());
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Click | Pick | Crop | Compress"),
//      ),
//      body: Center(
//        child: _image == null
//            ? Text("Image")
//            : Image.file(
//          _image,
//          height: 200,
//          width: 200,
//        ),
//      ),
//      floatingActionButton: Row(
//        mainAxisAlignment: MainAxisAlignment.end,
//        children: <Widget>[
//          FloatingActionButton.extended(
//            label: Text("Camera"),
//            onPressed: () => getImageFile(ImageSource.camera),
//            heroTag: UniqueKey(),
//            icon: Icon(Icons.camera),
//          ),
//          SizedBox(
//            width: 20,
//          ),
//          FloatingActionButton.extended(
//            label: Text("Gallery"),
//            onPressed: () => getImageFile(ImageSource.gallery),
//            heroTag: UniqueKey(),
//            icon: Icon(Icons.photo_library),
//          )
//        ],
//      ),
//    );
//  }
//}
////
////
////
//////import 'dart:math';
//////
//////import 'package:camera/camera.dart';
//////import 'package:flutter/cupertino.dart';
//////import 'package:flutter/material.dart';
//////import 'package:image_picker/image_picker.dart';
//////import 'package:path/path.dart';
//////import 'package:path_provider/path_provider.dart';
//////import 'package:sidebaranimationflutter/license/previewScreen.dart';
//////
//////class CameraScreen extends StatefulWidget {
//////  @override
//////  _CameraScreenState createState() => _CameraScreenState();
//////}
//////
//////class _CameraScreenState extends State {
//////  CameraController controller;
//////  List cameras;
//////  int selectedCameraIndex;
//////  String imgPath;
//////  Flex imageFile;
//////
//////  _onGallery()  async {
//////   var imageFile =  await ImagePicker.pickImage(source: ImageSource.gallery) ;
//////   return Image.file(imageFile, width: 400, height: 400,);
//////  }
//////
////////  _onCamera()  async {
////////    imageFile =   await ImagePicker.pickImage(source: ImageSource.gallery) ;
////////    return Image.file(imageFile, width: 400, height: 400,);
////////  }
//////  @override
//////  void initState() {
//////    super.initState();
//////    availableCameras().then((availableCameras) {
//////      cameras = availableCameras;
//////
//////      if (cameras.length > 0) {
//////        setState(() {
//////          selectedCameraIndex = 0;
//////        });
//////        _initCameraController(cameras[selectedCameraIndex]).then((void v) {});
//////      } else {
//////        print('No camera available');
//////      }
//////    }).catchError((err) {
//////      print('Error :${err.code}Error message : ${err.message}');
//////    });
//////  }
//////
//////  Future _initCameraController(CameraDescription cameraDescription) async {
//////    if (controller != null) {
//////      await controller.dispose();
//////    }
//////    controller = CameraController(cameraDescription, ResolutionPreset.high);
//////
//////    controller.addListener(() {
//////      if (mounted) {
//////        setState(() {});
//////      }
//////
//////      if (controller.value.hasError) {
//////        print('Camera error ${controller.value.errorDescription}');
//////      }
//////    });
//////
//////    try {
//////      await controller.initialize();
//////    } on CameraException catch (e) {
//////      _showCameraException(e);
//////    }
//////    if (mounted) {
//////      setState(() {});
//////    }
//////  }
//////
//////  @override
//////  Widget build(BuildContext context) {
//////    return Scaffold(
//////      body: Container(
//////        child: Column(
//////          crossAxisAlignment: CrossAxisAlignment.stretch,
//////          children: <Widget>[
//////            Expanded(
//////              flex: 1,
//////              child: _cameraPreviewWidget(),
//////            ),
//////            Align(
//////              alignment: Alignment.bottomCenter,
//////              child: Container(
//////                height: 120,
//////                width: double.infinity,
//////                padding: EdgeInsets.all(15),
//////                color: Colors.black,
//////                child: Row(
//////                  mainAxisAlignment: MainAxisAlignment.start,
//////                  children: <Widget>[
//////                    _cameraToggleRowWidget(),
//////                    _cameraControlWidget(context),
//////                    Spacer()
//////                  ],
//////                ),
//////              ),
//////            )
//////          ],
//////        ),
//////      ),
//////    );
//////  }
//////
//////  /// Display Camera preview.
//////  Widget _cameraPreviewWidget() {
//////    if (controller == null || !controller.value.isInitialized) {
//////      return const Text(
//////        'Loading',
//////        style: TextStyle(
//////          color: Colors.white,
//////          fontSize: 20.0,
//////          fontWeight: FontWeight.w900,
//////        ),
//////      );
//////    }
//////
//////    return AspectRatio(
//////      aspectRatio: controller.value.aspectRatio,
//////      child: CameraPreview(controller),
//////    );
//////  }
//////
//////  /// Display the control bar with buttons to take pictures
//////  Widget _cameraControlWidget(context) {
//////    return Expanded(
//////      child: Align(
//////        alignment: Alignment.center,
//////        child: Row(
//////          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//////          mainAxisSize: MainAxisSize.max,
//////          children: <Widget>[
//////            FloatingActionButton(
//////              child: Icon(
//////                Icons.camera,
//////                color: Colors.black,
//////              ),
//////              backgroundColor: Colors.white,
//////              onPressed: () {
//////                _onCapturePressed(context);
//////              },
//////            )
//////          ],
//////        ),
//////      ),
//////    );
//////  }
//////
//////  /// Display a row of toggle to select the camera (or a message if no camera is available).
//////
//////  Widget _cameraToggleRowWidget() {
//////    if (cameras == null || cameras.isEmpty) {
//////      return Spacer();
//////    }
//////    CameraDescription selectedCamera = cameras[selectedCameraIndex];
//////    CameraLensDirection lensDirection = selectedCamera.lensDirection;
//////
//////    return Expanded(
//////      child: Align(
//////        alignment: Alignment.centerLeft,
//////        child: Row(
//////          children: <Widget>[
//////            FlatButton.icon(
//////              onPressed: _onSwitchCamera,
//////              icon: Icon(
//////                _getCameraLensIcon(lensDirection),
//////                color: Colors.white,
//////                size: 24,
//////              ),
//////              label: Text(
//////                '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
//////                style: TextStyle(
//////                    color: Colors.white,
//////                    fontWeight: FontWeight.w500
//////                ),),
//////            ),
//////            FlatButton.icon(
//////              onPressed: _onSwitchCamera,
//////              icon: Icon(
//////                _onGallery(),
//////                color: Colors.white,
//////                size: 24,
//////              ),
//////              label: Text(
//////                '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
//////                style: TextStyle(
//////                    color: Colors.white,
//////                    fontWeight: FontWeight.w500
//////                ),),
//////            ),
//////          ],
//////        ),
//////      ),
//////
//////    );
//////  }
//////
//////  IconData _getCameraLensIcon(CameraLensDirection direction) {
//////    switch (direction) {
//////      case CameraLensDirection.back:
//////        return CupertinoIcons.switch_camera;
//////      case CameraLensDirection.front:
//////        return CupertinoIcons.switch_camera_solid;
//////      case CameraLensDirection.external:
//////        return Icons.camera;
//////      default:
//////        return Icons.device_unknown;
//////    }
//////  }
//////
//////  void _showCameraException(CameraException e) {
//////    String errorText = 'Error:${e.code}\nError message : ${e.description}';
//////    print(errorText);
//////  }
//////
//////  void _onCapturePressed(context) async {
//////    try {
//////      final path =
//////      join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
//////      await controller.takePicture(path);
//////
//////      Navigator.push(
//////        context,
//////        MaterialPageRoute(
//////            builder: (context) => PreviewScreen(
//////              imgPath: path,
//////            )),
//////      );
//////    } catch (e) {
//////      _showCameraException(e);
//////    }
//////  }
//////
//////  void _onSwitchCamera() {
//////    selectedCameraIndex =
//////    selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
//////    CameraDescription selectedCamera = cameras[selectedCameraIndex];
//////    _initCameraController(selectedCamera);
//////  }
//////}
