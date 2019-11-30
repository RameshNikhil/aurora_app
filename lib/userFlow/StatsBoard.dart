import 'package:aurora_app/userFlow/CentralPage.dart';
import 'package:aurora_app/utilities/emptyCells.dart';
import 'package:aurora_app/utilities/showUp.dart';
import 'package:flutter/material.dart';

class StatsBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Shader is for gradient text
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc39cf4), Color(0xff9D78F3)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


      int delayAmount = 500;


    
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



ShowUp(
  child: Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 16.0, right: 8.0, left: 8.0),
              child: Container(
              
                height: 360,
                child: Image.asset("lib/assets/images/graph.png", height: 400,),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0),
              borderRadius: BorderRadius.circular(1400.0),
              
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 40.0,
                ),
              ]),
              ), 

              
            ),
),


    //         Padding(
    //   padding: EdgeInsets.all(0.0),
    //   child: GridView.count(
    //     crossAxisCount: 2,
    //     padding: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 16.0),
    //     childAspectRatio: 8.0 / 10.5,
    //     mainAxisSpacing: 32.0,
    //     crossAxisSpacing: 16.0,
    //     children: <Widget>[

    //       //cell 1 and 2 

    //       //  ShowUp(
    //       //           child: EmptyCell(
    //       //             title: "Loan Details",
    //       //             detail: "Help us understand your loan requirements",
    //       //             //trigger: introClosed,
    //       //           ),
    //       //           delay: delayAmount * 2,
    //       //         ),

    //       //  ShowUp(
    //       //           child: EmptyCell(
    //       //             title: "Loan Details",
    //       //             detail: "Help us understand your loan requirements",
    //       //             //trigger: introClosed,
    //       //           ),
    //       //           delay: delayAmount * 3,
    //       //         ),


         
    //     ],
    //   ),
    // ),
        
          
            


          ],
        ),
      ),
    );
    
  }
}