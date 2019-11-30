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
            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 5.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Your, ",
                      style: TextStyle(
                          fontSize: 30.0,
                          // foreground: Paint()..shader = linearGradient
                          color: Color(0xff8636fa)
                          ),
                    ),
                    Text(
                      "Progress",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          //foreground: Paint()..shader = linearGradient
                          color: Color(0xff8636fa)
                          ),
                    ),
                  ],
                )),




            Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 16.0, right: 8.0, left: 8.0),
              child: Container(
                child: Image.asset("lib/assets/images/graph.png", height: 400,),
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 40.0,
                ),
              ]),
              ), 

              
            ),
        
          
            


          ],
        ),
      ),
    );
    
  }
}