import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/ui/home.dart';
import 'package:my_chat/ui/splash.dart';
import 'package:my_chat/util/kons.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(new MyApp());
}

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => Home(cameras),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: Kons.name,
        theme: new ThemeData(
          primaryColor: Color(0xff8B4513),
          accentColor: Color(0xffffc400),
        ),
        debugShowCheckedModeBanner: false,
        home: Splash(),
        routes: routes);
  }
}
