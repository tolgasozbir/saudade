import 'package:flutter/material.dart';

void mySnackBar(BuildContext context,String text,int duration){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text,style: TextStyle(color: Colors.white70)),
      duration: Duration(seconds: duration), 
      backgroundColor: Colors.black38, 
    )
  );
}