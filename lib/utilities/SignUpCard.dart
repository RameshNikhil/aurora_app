
import 'package:flutter/material.dart';

class SignUpCard extends StatefulWidget {
 var locStore;
  SignUpCard({this.locStore});



  @override
  _SignUpCard createState() =>  _SignUpCard();
}

class _SignUpCard extends State<SignUpCard> {

  var welcomeVis = true;

  @override
  Widget build(BuildContext context) {

      TextEditingController phoneController = TextEditingController();
    TextEditingController bankYesController = TextEditingController();


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
                                  padding: EdgeInsets.only(
                                      left: 15.0, top: 15.0, bottom: 40.0),
                                  child: Text(
                                    "Lets get you signed up!",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.0, bottom: 10.0),
                                  child: Text(
                                    "What is your phone number? ",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.0, bottom: 20.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'phone number #...',
                                    ),
                                    style: TextStyle(fontSize: 15.0),
                                    controller: phoneController,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.0, bottom: 10.0),
                                  child: Text(
                                    "Do you have an existing bank account? ",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.0, bottom: 10.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Yes or No...',
                                    ),
                                    style: TextStyle(fontSize: 15.0),
                                    controller: bankYesController,
                                  ),
                                ),
                                GestureDetector(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 220.0,
                                        right: 8,
                                        bottom: 20,
                                        top: 0),
                                    child: Container(
                                      //width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12.0),
                                            child: Text("Done",
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),]

                              
                              ),),

                          ),

                          onTap: (){
                            widget.locStore.setItem("phoneNum", phoneController.text);
                            widget.locStore.setItem("bankYes", bankYesController.text);
                          },
                        ),
                            ],
                      ),

                        ),),
                    ],
                  ),
                ),
              ),
              onTap: () {
              },
            ),
          ),
        
        ],
      ),
    ));
  }
}

