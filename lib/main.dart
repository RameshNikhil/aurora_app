import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './routing/fadeRoute.dart';
import './userFlow/pageOne.dart';

void main() {
  //SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      canvasColor: Colors.white,
      primaryColor: Colors.white,
      fontFamily: 'Montserrat',
      appBarTheme: AppBarTheme(
        color: Colors.white,
      ),
    ),
    home: new SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 2);

    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, FadeRouteBuilder(page: PageOne()));
  }

  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.0, 1.0),
                end: Alignment(-1.0, -1.0),
                stops: [0.1, 0.9],
                colors: [
                  Color(0xff7f41f4),
                  Color(0xff9e34ba),
                ],
              ),
            ),
            child: Center(
              child: Text("aurora",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  )),
            )
            ));
  }
}
