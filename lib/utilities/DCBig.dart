import 'package:flutter/material.dart';


class DownloadCellBig extends StatefulWidget {
  var title;
  var detail;
  var trigger; 
  var flip; 

  DownloadCellBig({
    @required this.title,
    @required this.detail,
    @required this.trigger,
    @required this.flip
  });


  @override
  _DownloadCellBigState createState() => new _DownloadCellBigState();
}

class _DownloadCellBigState extends State<DownloadCellBig> {

  var welcomeVis = true;

  @override
  Widget build(BuildContext context) {
        return Visibility(
                                visible: welcomeVis,
                                child: 
        
        Padding(
          padding: EdgeInsets.only(bottom: 10.0, left: 6.0, right: 3.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
                child: InkWell(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10), //This makes is PHAT
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.0, 1.0),
                    end: Alignment(-1.0, -1.0),
                    stops: [0.1, 0.9],
                    colors: [
                      Color(0xfff2f2f2),
                      Color(0xffc1c1c1),
                      
                    ],
                  ),
                  //color: Colors.grey.shade200.withOpacity(0.3),
                  borderRadius: new BorderRadius.circular(20.0),
                  // boxShadow: [
                  // new BoxShadow(
                  //   color: Colors.grey[400],
                  //   blurRadius: 15.0,
                  //   offset: new Offset(0.0, 10.0),
                  // )],
                ),
                child: new IntrinsicHeight(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          child: new Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Padding(
                                padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 40.0),
                                child: Text("Welcome!", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold ),),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 15.0, bottom: 40.0),
                                child: Text("This is your homescreen.", style: TextStyle(fontSize: 15.0,  ),),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 15.0, bottom: 40.0),
                                child: Text("Tap on a tile to complete the task.", style: TextStyle(fontSize: 15.0,   ),),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 15.0, bottom: 40.0),
                                child: Text("Swipe left to access your stats dashboard.", style: TextStyle(fontSize: 15.0,   ),),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 15.0, bottom: 40.0),
                                child: Text("Swipe right to access anytime chat", style: TextStyle(fontSize: 15.0,   ),),
                              ),

                               GestureDetector(
                                child:  Padding(
                                padding: EdgeInsets.only(left: 220.0, right: 8, bottom: 8, top: 0),
                                child: Container(
                                  //width: 180, 
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 12.0),
                                        child:  Text("Done", style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold
                                        
                                      )),
                                      ),
                                      ],
                                  ),
                                ),
                              ),


                                onTap: (){

                                  setState(() {
                                    welcomeVis = false; 
                                    widget.trigger = true; 
                                    widget.flip = true; 

                                  });

                                },
                              ),
                              

                             
                              // new Text(widget.title,
                              //     style: Theme.of(context)
                              //         .textTheme
                              //         .subhead
                              //         .merge(TextStyle(
                              //             color: Colors.white,
                              //             fontWeight: FontWeight.bold))),
                              // new Text(widget.detail,
                              //     style: Theme.of(context)
                              //         .textTheme
                              //         .caption
                              //         .merge(TextStyle(color: Colors.white))),


                            ],
                          ),
                        ),
                      ),
                      // new Container(
                      //   margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      //   child: new InkWell(
                      //     child: new Icon(
                      //       Icons.chevron_right,
                      //       size: 15.0,
                      //       color: Colors.white,
                      //     ),
                      //     // onTap: () {
                      //     //   //open pdf -- assuming pdf reader has functions to send, markup...
                      //     // },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                //Navigator.push(context, FadeRouteBuilder(page: SingleDownload()));
              },
            ),
          ),
          // Icon(
          //   Icons.arrow_downward,
          //   size: 15.0,
          //   color: Colors.grey,
          // ),
        ],
      ),
    ));
  }
}

