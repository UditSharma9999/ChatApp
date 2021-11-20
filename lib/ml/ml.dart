import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import './realtime/live_camera.dart';
import './static%20image/static.dart';



class Ml extends StatefulWidget {
  final List<CameraDescription> cameras;
  const Ml(this.cameras,{ Key? key }) : super(key: key);

  @override
  _MlState createState() => _MlState();
}

class _MlState extends State<Ml> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 170,
                child: RaisedButton(
                  child: Text("Detect in Image"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => StaticImage(),
                      ),
                    );
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 160,
                child: RaisedButton(
                  child: Text("Real Time Detection"),
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LiveFeed(widget.cameras),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),      
    );
  }
}
