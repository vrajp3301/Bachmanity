import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.greenAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical:10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,

);

const kMessageContainerDecoration = BoxDecoration(
  color: Colors.green,
  border: Border(
    top: BorderSide(color: Colors.blue,width: 2.0),
  ),
);
