import 'package:aurora_app/routing/fadeRoute.dart';
import 'package:flutter/material.dart';

class CentralPage extends StatelessWidget {
  var locStore;
  CentralPage({this.locStore});

  @override
  Widget build(BuildContext context) {

    var userName = locStore.getItem('userName');

     //Shader is for gradient text
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc39cf4), Color(0xff9D78F3)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    var ourList = ["t1", "t2"];

    return new Scaffold(
      appBar: AppBar(elevation: 0),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 16.0),
              child: Row(
                children: <Widget>[
                  Text(
                "Hello, " ,
                style: TextStyle(
                    fontSize: 30.0,
                    foreground: Paint()..shader = linearGradient),
              ),

              Text(
                userName,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
                ],
              )
            ),

            for (String i in ourList)
              DownloadCell(
                title: i,
                detail: i,
              )

          ],
        ),
      ),
    );


  }
}


class DownloadCell extends StatefulWidget {
  var title;
  var detail; 

  DownloadCell({Key key, @required this.title, @required this.detail,}) : super(key: key);

  @override
  _DownloadCellState createState() => new _DownloadCellState();
}

class _DownloadCellState extends State<DownloadCell> {

  @override
  Widget build(BuildContext context) { 

    return Padding(
      padding: EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
      child: InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.0, 1.0),
            end: Alignment(-1.0, -1.0),
            stops: [0.1, 0.9],
            colors: [
              Color(0xffc39cf4).withOpacity(0.6),
              Color(0xff9D78F3).withOpacity(0.6),
            ],
          ),
          //color: Colors.grey.shade200.withOpacity(0.3),
          borderRadius: new BorderRadius.circular(5.0),
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
                      new Text(widget.title,
                          style: Theme.of(context).textTheme.subhead.merge(
                              TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      new Text(widget.detail,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .merge(TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 5.0),
                child: new InkWell(
                  child: new Icon(
                    Icons.chevron_right,
                    size: 15.0,
                    color: Colors.white,
                  ),
                  // onTap: () {
                  //   //open pdf -- assuming pdf reader has functions to send, markup...
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        //Navigator.push(context, FadeRouteBuilder(page: SingleDownload()));
      },
    ),
    );

    


  }
}