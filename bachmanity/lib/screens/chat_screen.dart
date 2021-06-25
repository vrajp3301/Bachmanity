import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bachmanity/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final mess = FirebaseFirestore.instance.collection('messages');
  final _auth = FirebaseAuth.instance;
  final textController = TextEditingController();
  User loggedInUser;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Typicons.times_outline),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Bachmanity'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Material(
        color: Colors.black,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                  stream: mess.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Color(0xFF00DF89),
                        ),
                      );
                    }
                    final Iterable<QueryDocumentSnapshot<Object>> documents = snapshot.data.docs.reversed;
                    List<MessageContent> messageContents = [];
                    for (var document in documents) {
                      final messageText = document.get('text');
                      final messageSender = document.get('sender');
                      final currentUser = loggedInUser.email;
                      final messageContent = MessageContent(
                        messText: messageText,
                        messSender: messageSender,
                        isCurrrent: currentUser == messageSender,
                      );

                      messageContents.add(messageContent);
                    }
                    return Expanded(
                      child: ListView(
                        reverse: true,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        children: messageContents,
                      ),
                    );
                  }),
              Padding(
                padding: EdgeInsets.all(13.0),
                child: Container(
                  decoration: kMessageContainerDecoration,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: textController,
                          onChanged: (value) {
                            messageText = value;
                          },
                          decoration: kMessageTextFieldDecoration,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          textController.clear();
                          _firestore.collection('messages').add({
                            'text': messageText,
                            'sender': loggedInUser.email
                          });
                          print(loggedInUser.email);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            'Send',
                            style: kSendButtonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageContent extends StatelessWidget {
  MessageContent({this.messText, this.messSender, this.isCurrrent});
  final String messText;
  final String messSender;
  final bool isCurrrent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isCurrrent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            messSender,
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          Material(
            borderRadius: isCurrrent
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(0.0))
                : BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(0.0),
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
            elevation: 7.0,
            color: isCurrrent ? Color(0xFF125D98) : Color(0xFF5E8B7E),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                messText,
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//77ACF1
