import '../views/signup.dart';
import '../views/signin.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  final List<CameraDescription> cameras;
  const Authenticate(this.cameras,{Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView,widget.cameras);
    } else {
      return SignUp(toggleView,widget.cameras);
    }
  }
}
