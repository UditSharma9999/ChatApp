import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import './deep_ar.dart';
import '../ml/ml.dart';
import './chatrooms.dart';

// class RoomView extends StatefulWidget {
//   const RoomView({ Key? key }) : super(key: key);

//   @override
//   _RoomViewState createState() => _RoomViewState();
// }

// class _RoomViewState extends State<RoomView> {
//   @override
//   Widget build(BuildContext context) {

//     final PageController pageController = PageController(initialPage: 0);

//     return PageView(
//         scrollDirection: Axis.horizontal,
//         controller: pageController,
//         children: const [
//           ChatRoom(), 
//           DeepAR()
//         ]
//       );
//   }
// }





class RoomView extends StatefulWidget {
  final List<CameraDescription> cameras;
  const RoomView(this.cameras,{ Key? key }) : super(key: key);

  @override
  _RoomViewState createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  final PageController pageController = PageController(initialPage: 1);
  
  @override
  Widget build(BuildContext context) {
    return PageView(
      reverse: true,
      scrollDirection:Axis.horizontal,
      controller: pageController,
      children: <Widget> [
        DeepAR(),
        ChatRoom(widget.cameras),
        Ml(widget.cameras),
        // DeepAR(),
        // Ar()
      ],
    );
  }
}


class Ar extends StatefulWidget {
  const Ar({ Key? key }) : super(key: key);
  @override
  _ArState createState() => _ArState();
}

class _ArState extends State<Ar> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Text("AR")
    );
  }
}