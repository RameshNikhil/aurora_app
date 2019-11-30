import '../utilities/showUp.dart';
import './HomeScreen.dart';
import '../routing/fadeRoute.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../routing/SlideBottomRoute.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 35.0),
                        child: Text("Hi,",
                            style: TextStyle(
                              fontSize: 27.0,
                              color: Colors.black,
                            )),
                      ),
                      delay: delayAmount,
                    ),
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 35.0),
                        child: Text(
                            "Welcome to Aurora, a simple journey to financial independence.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 2,
                              fontSize: 27.0,
                              //fontFamily: "Montserrat",
                              color: Colors.black,
                            )),
                      ),
                      delay: delayAmount * 3,
                    ),
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 190.0),
                        child: Text("Let's start with your name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 2,
                              fontSize: 27.0,
                              //fontFamily: "Montserrat",
                              color: Colors.black,
                            )),
                      ),
                      delay: delayAmount * 6,
                    ),
                    ShowUp(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 40.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name...',
                            ),
                            style: TextStyle(fontSize: 24.0),
                            controller: nameController,
                          ),
                        ),
                      ),
                      delay: delayAmount * 9,
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
                            Navigator.pushReplacement(context, FadeRouteBuilder(page: HomeScreen(locStore: locStore)));

                          
                          }
                        },
                      ),
                      delay: delayAmount * 11,
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
