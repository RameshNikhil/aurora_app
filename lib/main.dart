import 'dart:async';
import 'package:aurora_app/userFlow/IntroPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './routing/fadeRoute.dart';
import './userFlow/IntroPage.dart';
import 'package:localstorage/localstorage.dart';

void main() {

  final LocalStorage storage = LocalStorage('aurora_key');
  
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(
    FutureBuilder(
      future: storage.ready,
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == true) {
          Map<String, dynamic> data = storage.getItem('key');

          return 

           MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      canvasColor: Colors.white,
      primaryColor: Colors.white,
      fontFamily: 'Montserrat',
      appBarTheme: AppBarTheme(
        color: Colors.white,
      ),
    ),
    home: new SplashScreen(locStore : storage),
  );
          
        } else {
          return PlainScreen();
        }
      },
    ),
    
    
    
   );
}

class SplashScreen extends StatefulWidget {
  var locStore;
  SplashScreen({this.locStore});

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  startTime() async {
    var _duration = new Duration(seconds: 2);

    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, FadeRouteBuilder(page: IntroPage(locStore: widget.locStore)));
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
                  Color(0xfffaaacb),
                  Color(0xff8636fa),
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


class PlainScreen extends StatelessWidget {
  const PlainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material();
  }
}