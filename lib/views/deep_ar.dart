// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import "package:camera_deep_ar/camera_deep_ar.dart";

const key ="56ced61ff312bb0a8788532f775b0161daf87a85c7be5b3c21abb37457abb7bcec7e04943c4858dd";

List<CameraDescription>? cameras;

class DeepAR extends StatefulWidget {
  const DeepAR();
  
  @override
  _DeepARState createState() => _DeepARState();
}

class _DeepARState extends State<DeepAR> {
  CameraDeepArController? cameraDeepArController;
  int effectCount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            CameraDeepAr(
                onCameraReady: (isReady) {
                  setState(() {});
                },
                onImageCaptured: (path) {
                  setState(() {});
                },
                onVideoRecorded: (path) {
                  setState(() {});
                },
                androidLicenceKey: key,
                // iosLicenceKey: key,
                iosLicenceKey:
                    'dca2fa1448aeac0667d7882b9d32de5f4f7ca9ad4dd277379a17a478b7f46cb80617dbaaa9cc8bf5',
                cameraDeepArCallback: (c) async {
                  cameraDeepArController = c;
                  setState(() {});
                }),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                        backgroundColor: Colors.amber,
                        child: const Icon(Icons.navigate_next),
                        onPressed: () => {
                              cameraDeepArController!.changeMask(effectCount),
                              if (effectCount == 7) {effectCount = 0},
                              effectCount++
                            })))
          ],
        ),
        // floatingActionButton: FloatingActionButton(onPressed: (() async {
          // try {
          //   // cameras = await availableCameras();
          // } catch (e) {
          //   print('$e Error ==========>');
          // }
          // if (cameras != null) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => LiveFeed(cameras!),
            //   ),
            // );
          // }
        // })),
        // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
