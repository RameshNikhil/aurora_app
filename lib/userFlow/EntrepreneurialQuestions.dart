import 'package:flutter/material.dart';
import '../utilities/showUp.dart';

class EntrepreneurialQuestions extends StatefulWidget {
  @override
  _MessagePageSavingsJourneyState createState() =>
      _MessagePageSavingsJourneyState();
}

class _MessagePageSavingsJourneyState extends State<EntrepreneurialQuestions> {
  int delayAmount = 500;
  var messageIndex = 0;
  final List<String> _prefill = [
    "Why do you want to start this?",
    "Who will be involved in it with you (if any)?",
    "How will you get customers?",
    "Submit your business plan",
    "Thanks for the information. You can track your progress in your dashboard. ",
    "End"
  ];
  // final List<String> _messages = ["How much money do you want to burrow?"];

  var _messages = [
    {"text": "What business would you like to start?", "colored": true},
  ];

  TextEditingController messageEditingController = TextEditingController();
  ScrollController _scrollController = new ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );
  void _handleSubmitted() {
    if (messageEditingController.text.trim() != "") {
      delayAmount = 0;

      setState(() {
        // _messages.add(messageEditingController.text);
        // _messages.add(messageEditingController.text);
        // _messages.add(_prefill[messageIndex]);

        _messages.add({
          "text": messageEditingController.text,
          "colored": false,
          "delay": 100
        });
        _messages.add(
            {"text": _prefill[messageIndex], "colored": true, "delay": 500});
      });

      if (messageIndex == _prefill.length - 1) {
        Navigator.pop(context);
      }
      Future.delayed(const Duration(milliseconds: 200), () {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent);
      });

      messageEditingController.clear();
      setState(() {
        messageIndex += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ..._messages
                        .map((message) => ShowUp(
                            child: _messageToUser(message),
                            delay: message["delay"]))
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
    if (message["colored"].toString() == "true") {
      colourz = Color(0xff8636fa).withOpacity(0.33);
    }
    return Center(
        child: Column(
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
          hintText: 'Type here...',
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
