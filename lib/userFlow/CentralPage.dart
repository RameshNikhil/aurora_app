import 'package:aurora_app/routing/fadeRoute.dart';
import 'package:aurora_app/userFlow/IntroPage.dart';
import 'package:aurora_app/userFlow/StatsBoard.dart';
import 'package:aurora_app/utilities/DCBig.dart';
import 'package:aurora_app/utilities/DCX.dart';
import 'package:aurora_app/utilities/SignUpCard.dart';
import 'package:aurora_app/utilities/showUp.dart';
import 'package:flutter/material.dart';
import '../utilities/DCBig.dart';
import './MessagePageLoanDetails.dart';
import './MessagePageSavingsJourney.dart';

class CentralPage extends StatelessWidget {
  var locStore;
  CentralPage({this.locStore});

  int delayAmount = 500;

  var introClosed = false;

  @override
  Widget build(BuildContext context) {
    var userName = locStore.getItem('userName');

    var flip = false; 

    //Shader is for gradient text
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc39cf4), Color(0xff9D78F3)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    //start this from 2
    var tiles = [
      {"title": "t1", "subTitle": "78"},
      {"title": "t2", "subTitle": "69"},
      {"title": "t2", "subTitle": "69"}
    ];

    //var count = ourList.length;

    return new Scaffold(
      appBar: AppBar(elevation: 0),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: ListView(
          children: <Widget>[
            // Image.asset("lib/assets/images/dotLeft.png",),
            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 5.0),
                child: Row(
                  children: <Widget>[
                    ShowUp(
                        child: Text(
                          "Hello, ",
                          style: TextStyle(
                              fontSize: 30.0,
                              // foreground: Paint()..shader = linearGradient
                              color: Color(0xff8636fa)),
                        ),
                        delay: delayAmount),
                    ShowUp(
                      child: Text(
                        userName,
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            //foreground: Paint()..shader = linearGradient
                            color: Color(0xff8636fa)),
                      ),
                      delay: delayAmount * 2,
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 26.0),
                child: Row(
                  children: <Widget>[
                    ShowUp(
                      child: Text(
                        "Your journey starts here:",
                        style: TextStyle(
                            fontSize: 20.0,
                            foreground: Paint()..shader = linearGradient),
                      ),
                      delay: delayAmount * 3,
                    ),
                  ],
                )),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  ShowUp(
                    child: DownloadCellBig(
                      title: "xyz",
                      detail: "xyz",
                      trigger: introClosed,
                      flip: flip,
                    ),
                    delay: delayAmount * 4,
                  ),
                  
                  ShowUp(
                      child: DownloadCell(
                        title: "1. Loan Details",
                        detail: "Help us understand your financial and non-financial goals.",
                        page: MessagePageLoanDetails(),
                        iconSize: 15.0,
                      ),
                      delay: delayAmount * 5,
                    ),


                   ShowUp(
                      child: SignUpCard(
                      locStore: locStore,
                    ),                   
                      delay: delayAmount * 6,
                    ),
                    

                    



                    ShowUp(
                      child: DCX(
                        title: "2. Your Savings Journey ",
                        detail: "Monitor your progress on the savings dashboard towards your goals",
                        page: StatsBoard(),
                      ),
                      delay: delayAmount * 7,
                    ),
                   


                   ShowUp(
                      child: DownloadCell(
                        title: "3. Your Entrepreneurial Journey ",
                        detail: "Explore the options you have to expand professionally ",
                        page: MessagePageLoanDetails(),
                        iconSize: 15.0,
                      ),
                      delay: delayAmount * 8,
                    ),


                    ShowUp(
                      child: DCX(
                        title: "4. Family Planning",
                        detail: "Plan goals for your family and personal life so that yuou can invest for a better future.",
                        page: MessagePageLoanDetails(),
                      ),
                      delay: delayAmount * 9,
                    ),


                  ShowUp(
                      child: DownloadCell(
                        title: "5. Your Life Goals Dashboard",
                        detail: "Track your progress towared financial independance, family planning andf entrepreneurship in this dashboard.",
                        page: MessagePageLoanDetails(),
                        iconSize: 0.0,
                      ),
                      delay: delayAmount * 10,
                    ),


                   
                    // DraggableScrollableSheet(
                    //   builder: (context, scrollController){
                    //     return SingleChildScrollView(
                    //       controller: scrollController,
                    //       child: StatsBoard(),
                    //     );
                    //   },
                    // )
                   



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadCell extends StatefulWidget {
  var title;
  var detail;
  var page; 
  var iconSize;

  DownloadCell({
    @required this.title,
    @required this.detail,
    @required this.page,
    @required this.iconSize
  });

  @override
  _DownloadCellState createState() => new _DownloadCellState();
}

class _DownloadCellState extends State<DownloadCell> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0, left: 6.0, right: 3.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0), //this makes is THIN
            child: InkWell(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 40), //This makes is PHAT
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
            size: widget.iconSize,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

// class populateRemainder extends StatelessWidget {
//   var introClosed;
//   var tiles;

//   populateRemainder({this.introClosed, this.tiles});

//   @override
//   Widget build(BuildContext context) {

//     if (introClosed == true) {
//        return Column(
//          children: <Widget>[

//               ...tiles
//                 .map((tile) => DownloadCell(
//                       title: tile["title"],
//                       detail: tile["subTitle"],
//                     ))
//                 .toList()

//          ],
//        );

//     } else {
//       return Material();
//     }

//   }
// }
