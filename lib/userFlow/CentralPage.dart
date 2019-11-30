import 'package:flutter/material.dart';

class CentralPage extends StatelessWidget {
  var locStore;
  CentralPage({this.locStore});

  @override
  Widget build(BuildContext context) {

    var userName = locStore.getItem('userName');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false, // Don't show the leading button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            //components of the 
         
          ],
        ),
      ),
      body: Column(
        children: <Widget>[

          TopText(userName: userName,),

          //GoalCells(),

          


        ],
      ),
    );
  }
}

class TopText extends StatelessWidget {
  
  var userName; 
  TopText({this.userName});

  @override
  Widget build(BuildContext context) {
    //This is the top text
    return Padding(
      padding: EdgeInsets.fromLTRB(36.0, 0.0, 36.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Hello ",
                  style: TextStyle(
                    fontSize: 31.0,
                    color: Colors.black,
                  )),
              Text(userName,
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          
        ],
      ),
    );
  }
}
