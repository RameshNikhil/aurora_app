import '../utilities/showUp.dart';
import './HomeScreen.dart';
import '../routing/fadeRoute.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class IntroPage extends StatelessWidget {
  var locStore;
  IntroPage({this.locStore});

  @override
  Widget build(BuildContext context) {
    int delayAmount = 500;

    PageController _controller = PageController();
    TextEditingController nameController = TextEditingController();

    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        //Page 1
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(28.0, 60.0, 28.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 35.0),
                        child: Text("Hi,",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                            )),
                      ),
                      delay: delayAmount,
                    ),
                    ShowUp(
                      child: Text("Welcome to Aurora, a",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            height: 2,
                            fontSize: 25.0,
                            //fontFamily: "Montserrat",
                            color: Colors.black,
                          )),
                      delay: delayAmount * 3,
                    ),
                    ShowUp(
                      child: Text("simple journey to financial",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            height: 2,
                            fontSize: 25.0,
                            //fontFamily: "Montserrat",
                            color: Colors.black,
                          )),
                      delay: delayAmount * 5,
                    ),
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 35.0),
                        child: Text("independence.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              height: 2,
                              fontSize: 25.0,
                              //fontFamily: "Montserrat",
                              color: Colors.black,
                            )),
                      ),
                      delay: delayAmount * 7,
                    ),
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 170.0,),
                        child: Text("Let's start with your name.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              height: 2,
                              fontSize: 25.0,
                              //fontFamily: "Montserrat",
                              color: Colors.black,
                            )),
                      ),
                      delay: delayAmount * 10,
                    ),
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 40.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'name...',
                          ),
                          style: TextStyle(fontSize: 24.0),
                          controller: nameController,
                        ),
                      ),
                      delay: delayAmount * 12,
                    ),
                    ShowUp(
                      child: GestureDetector(
                        child: Icon(Icons.keyboard_arrow_down),
                        onTap: () {
                          if (nameController.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                    title: Text("Missing Name"),
                                    content: Text(
                                        "Please add name before continuing"),
                                    actions: <Widget>[
                                      // usually buttons at the bottom of the dialog
                                      FlatButton(
                                        child: Text("Close"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            String text = nameController.text;

                            locStore.setItem('userName', text);
                            //SlideUp
                            Navigator.pushReplacement(
                                context,
                                FadeRouteBuilder(
                                    page: HomeScreen(locStore: locStore)));
                          }
                        },
                      ),
                      delay: delayAmount * 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 3
      ],
    );
  }
}
