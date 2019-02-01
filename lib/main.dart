import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/ui/home.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My Chat",
      theme: new ThemeData(
        primaryColor: new Color(0xff8B4513),
        accentColor: new Color(0xffffc400),
      ),
      debugShowCheckedModeBanner: false,
      home: new Home(cameras),
    );
  }
}
