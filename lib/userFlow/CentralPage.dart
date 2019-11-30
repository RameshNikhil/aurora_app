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

          GoalCells(),

          


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



class GoalCells extends StatefulWidget {
  var goal;
  var point;

  @override
  _GoalCellsState createState() => new _GoalCellsState();
}

class _GoalCellsState extends State<GoalCells> {
  @override
  Widget build(BuildContext context) {
    //Shader is for gradient text
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc39cf4), Color(0xff9D78F3)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    //LETS PRETEND THERE IS AN ARRAY WE HAVE. MAY PRETEND WE PASS IN FROM ANOTHER CLASS
    //WITH THE FIRST BEING THE TITLE AND THE SECOND BEING THE DETAIL

    var stepsList = ["test", "test2"];

    //NEED TO FIX PADDING

    return new Scaffold(
      appBar: AppBar(elevation: 0),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
              child: Text(
                'Roadmap',
                style: new TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),

            for(var i = 0; i < stepsList.length; i++ ) {

              SingleGoalCell(
                goal: goal, 
                point: point
              ),

            }

          ],
        ),
      ),
    );
  }
}

