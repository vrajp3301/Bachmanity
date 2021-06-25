import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w900,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintStyle:TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
  hintText: 'Type your message here...',
  fillColor: Colors.black,
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  color: Color(0xFF343A40),
  // color: Colors.black,
  borderRadius: BorderRadius.all(Radius.circular(30.0)),
  border: Border(
    top: BorderSide(color: Color(0xFF00DF89), width: 2.0),
    bottom: BorderSide(color: Color(0xFF00DF89), width: 2.0),
    left: BorderSide(color: Color(0xFF00DF89), width: 2.0),
    right: BorderSide(color: Color(0xFF00DF89), width: 2.0),
  ),
);

const kInputDecoration = InputDecoration(
  hintText: 'Enter Value',
  hintStyle: TextStyle(color: Colors.white),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF00D3C7), width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFFFC074), width: 4.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
