import 'package:flutter/material.dart';

class StatsBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Shader is for gradient text
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc39cf4), Color(0xff9D78F3)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


    return new Scaffold(
      appBar: AppBar(elevation: 0),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: ListView(
          children: <Widget>[

                    Text(
                      "Your Stats",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          //foreground: Paint()..shader = linearGradient
                          color: Color(0xff8636fa)
                          ),
                    ),
                  ],
                
           



          
        ),
      ),
    );
    
  }
}