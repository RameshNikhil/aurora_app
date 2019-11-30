import 'package:flutter/material.dart';
import '../utilities/showUp.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  int delayAmount = 500;
  final List<String> _messages = ["sameer", "is", "the", "big", "gay"];

  TextEditingController messageEditingController = TextEditingController();

  void _handleSubmitted() {
    if (messageEditingController.text.trim() != "") {
      delayAmount = 0;
      setState(() {
        _messages.add(messageEditingController.text);
      });
      messageEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
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
                            (message) => ShowUp(child: _messageToUser(message)))
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
    return Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Container(
          child: Text(
            message,
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(16.0)))),
    ]));
  }

  Widget _textInput() {
    return Row(children: <Widget>[
      Flexible(
          child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ask me Anything...',
        ),
        style: TextStyle(fontSize: 18.0),
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
