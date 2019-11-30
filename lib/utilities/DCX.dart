import 'package:aurora_app/routing/fadeRoute.dart';
import 'package:flutter/material.dart';
class DCX extends StatefulWidget {
  var title;
  var detail;
  var page; 

  DCX({
    @required this.title,
    @required this.detail,
    @required this.page,
  });

  @override
  _DCX createState() => new _DCX();
}

class _DCX extends State<DCX> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    horizontal: 10.0, vertical: 80), //This makes is PHAT
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.0, 1.0),
                    end: Alignment(-1.0, -1.0),
                    stops: [0.1, 0.9],
                    colors: [
                      Color(0xffc39cf4).withOpacity(0.90),
                      Color(0xff9D78F3).withOpacity(0.90),
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
                                child: Text(widget.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subhead
                                        .merge(TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))),
                                padding: EdgeInsets.only(left: 15.0),
                              ),
                              Padding(
                                child: Text(widget.detail,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .merge(TextStyle(color: Colors.white))),
                                padding: EdgeInsets.only(left: 15.0),
                              ),
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
                Navigator.push(context, FadeRouteBuilder(page: widget.page));
              },
            ),
          ),
          Icon(
            Icons.arrow_downward,
            size: 15.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}