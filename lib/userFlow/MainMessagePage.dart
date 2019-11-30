import 'package:flutter/material.dart';
import '../utilities/showUp.dart';

class MainMessagePage extends StatefulWidget {
  var homePageController;
  MainMessagePage({this.homePageController});

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MainMessagePage> {
  int delayAmount = 500;
  var messageIndex = 0;
  final List<String> _prefill = ["How long do you want to take?", "When do you need the loan? (dd/mm/yy)", "Have you attempted to get a loan from another organisation but failed?", "Pick a category for what purpose you will be using the loan for? (family, entrepenuership, etc.)"];
  // final List<String> _messages = ["How much monday do you want to burrow?"];

  var _messages = [
    {"text":"What would you like to know?", "colored":true},
    {"text":"type 'help' for a list of commands", "colored":true},
  ];

  TextEditingController messageEditingController = TextEditingController();

  void _handleSubmitted() {
    var inputText = 
      messageEditingController.text
    ;
      // setState(() {
      //   _messages.add({"text":_prefill[messageIndex], "colored": true, "delay":500});
      // });

      setState(() {
        _messages.add({"text":inputText, "colored": false, "delay":100});
      });

    if (messageEditingController.text.trim() != "") {
      delayAmount = 0;

      if(messageEditingController.text == "savings"){
          _messages.add({"text":"your total savings are 176.40AUD \n in the last 2 months you saved 25 this week", "colored": true, "delay":500});
      }
      else if(messageEditingController.text.contains("weekly savings")){
          _messages.add({"text":"Your weekly savings are 14, 10, 19.1, 40. 24.3, 25 \n This week is 20% above average" , "colored": true, "delay":500});
      }
       else if(messageEditingController.text.contains("next task")){
          _messages.add({"text":"- increase your income by 5% for 1 week \n - pay 3 months of bills on time" , "colored": true, "delay":500});
      }
       else if(messageEditingController.text.contains("more tasks")){
                   _messages.add({"text":"- savings 255.6 AUD more% \n - reduce expenses by 7.5% for 2 weeks" , "colored": true, "delay":500});

      }
       else if(messageEditingController.text.contains("quiz")){
            _messages.add({"text":"your next quiz will be ready in 3 days" , "colored": true, "delay":500});
      }
       else if(messageEditingController.text.contains("tips")){
            _messages.add({"text":"what would you like to learn about \n ask about loans, saving money, increasing your income etc." , "colored": true, "delay":500});
      } else if(messageEditingController.text.contains("loans")){
            _messages.add({"text":"Personal Loands \n https://www.moneysmart.gov.au/borrowing-and-credit/other-types-of-credit/personal-loans \n \n Payday Loans \n https://www.moneysmart.gov.au/borrowing-and-credit/payday-loans" , "colored": true, "delay":500});
      } else {
        _messages.add({"text":"Hey! Try asking me about your savings, tips for saving, or your next task! Click the ? button on the top left for more." , "colored": true, "delay":500});
      }

    

      messageEditingController.clear();
      setState((){
        messageIndex+= 1;}
      );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          
            appBar:  AppBar(
               leading:  IconButton(
            icon:  Icon(Icons.chevron_left),
            onPressed: () {
              widget.homePageController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
            }
            ),
              actions: <Widget>[

           new IconButton(
             icon: new Icon(Icons.blur_on),
            onPressed: () {
              showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            titlePadding: EdgeInsets.fromLTRB(28, 18, 0, 0),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Text("You can type the following commands:"),
            content: Text("body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
            },
           ),





         ],
            elevation: 0,
            ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              //controller: controller,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ..._messages
                        .map(
                            (message) => ShowUp(child: _messageToUser(message), delay: message["delay"]))
                        .toList()
                  ]),
            ),
          ),
          bottomNavigationBar: ShowUp(
            child: Padding(
                padding: EdgeInsets.fromLTRB(24.0, 16.0, 3.0, 16.0),
                child: _textInput()),
            delay: delayAmount,
          ),
        ),
      ),
    );
  }

  Widget _messageToUser(message) {
    var colourz = Colors.grey[100];
    if(message["colored"].toString() == "true"){
    colourz = Color(0xff8636fa).withOpacity(0.33);
    }
    return Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Container(
          child: Text(
            message["text"],
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: BoxDecoration(
              color: colourz,
              borderRadius: BorderRadius.all(Radius.circular(16.0)))),
    ]));
  }

  Widget _textInput() {
    return Row(children: <Widget>[
      Flexible(
          child: TextField(
          decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ask me anything...',
        ),
        style: TextStyle(fontSize: 17.0),
        controller: messageEditingController,
      )),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        child: IconButton(
          icon: Icon(Icons.chevron_right),
          onPressed: () {
            _handleSubmitted();
          },
        ),
      )
    ]);
  }

  Widget _sendIcon() {}
}
